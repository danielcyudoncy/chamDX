import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';
import '../repositories/firestore_repository.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreRepository _repository = FirestoreRepository();
  final LocalAuthentication _localAuth = LocalAuthentication();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  final RxBool isLoading = false.obs;
  final Rx<User?> firebaseUser = Rx<User?>(null);
  final Rxn<UserModel> currentUserModel = Rxn<UserModel>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, (user) {
      if (user != null) {
        fetchCurrentUser(user.uid);
      } else {
        currentUserModel.value = null;
      }
    });
  }

  Future<void> fetchCurrentUser(String uid) async {
    try {
      final user = await _repository.getUser(uid);
      currentUserModel.value = user;
    } catch (e) {
      debugPrint('Error fetching user: $e');
    }
  }

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      // Save credentials for biometrics
      await _secureStorage.write(key: 'saved_email', value: email);
      await _secureStorage.write(key: 'saved_password', value: password);

      Get.offAllNamed(AppRoutes.residentDashboard);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Error', e.message ?? 'Authentication failed', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void register(String email, String password, String name, String phone, String address) async {
    try {
      isLoading.value = true;
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      await userCredential.user?.updateDisplayName(name);
      
      final userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        role: 'resident',
        estateId: '',
        unitNumber: address,
      );
      await _repository.createUser(userModel);
      
      await userCredential.user?.reload();
      firebaseUser.value = _auth.currentUser;
      currentUserModel.value = userModel;
      
      // Save credentials for biometrics
      await _secureStorage.write(key: 'saved_email', value: email);
      await _secureStorage.write(key: 'saved_password', value: password);

      Get.offAllNamed(AppRoutes.residentDashboard);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Registration Error', e.message ?? 'Sign up failed', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String address,
  }) async {
    try {
      isLoading.value = true;
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('No authenticated user found');
      }

      await currentUser.updateDisplayName(name);

      final updatedUser = UserModel(
        id: currentUser.uid,
        name: name,
        email: currentUser.email ?? '',
        phone: phone,
        role: currentUserModel.value?.role ?? 'resident',
        estateId: currentUserModel.value?.estateId ?? '',
        unitNumber: address,
      );

      await _repository.createUser(updatedUser);

      await currentUser.reload();
      firebaseUser.value = _auth.currentUser;
      currentUserModel.value = updatedUser;

      Get.back();
      Get.snackbar('Success', 'Profile updated successfully', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Update Error', 'Failed to update profile: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      Get.back(); // Navigate back to Login Screen
      Get.snackbar(
        'Success',
        'Password reset email sent. Please check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF6CF8BB),
        colorText: const Color(0xFF061447),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'Failed to send password reset email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();

      if (!canAuthenticate) {
        Get.snackbar(
          'Biometrics Unavailable',
          'Biometric authentication is not supported or set up on this device.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.8),
          colorText: Colors.white,
        );
        return;
      }

      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to log into chamDX',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );

      if (!didAuthenticate) {
        return;
      }

      final String? savedEmail = await _secureStorage.read(key: 'saved_email');
      final String? savedPassword = await _secureStorage.read(key: 'saved_password');

      if (savedEmail != null && savedPassword != null) {
        login(savedEmail, savedPassword);
      } else {
        Get.snackbar(
          'Setup Required',
          'No saved credentials found. Please log in manually first to enable biometrics.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.withValues(alpha: 0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Biometric Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        colorText: Colors.white,
      );
    }
  }
}
