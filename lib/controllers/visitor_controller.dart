import 'dart:math';
import 'package:get/get.dart';
import 'auth_controller.dart';
import '../models/visitor_pass_model.dart';
import '../repositories/firestore_repository.dart';

class VisitorController extends GetxController {
  final FirestoreRepository _repository = FirestoreRepository();
  final AuthController _authController = Get.find<AuthController>();

  final RxList<VisitorPassModel> visitorPasses = <VisitorPassModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final uid = _authController.firebaseUser.value?.uid;
    if (uid != null) {
      visitorPasses.bindStream(_repository.streamVisitorPasses(uid));
    }
  }

  Future<void> createPass({
    required String visitorName,
    required String vehiclePlate,
    required String visitDate,
    required String arrivalTime,
    required String purpose,
  }) async {
    try {
      isLoading.value = true;
      final uid = _authController.firebaseUser.value?.uid;
      if (uid == null) {
        throw Exception('User not authenticated');
      }

      // Generate random 6-digit access code (e.g., "524-910")
      final random = Random();
      final code1 = random.nextInt(900) + 100;
      final code2 = random.nextInt(900) + 100;
      final accessCode = '$code1-$code2';

      final newPass = VisitorPassModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        residentId: uid,
        visitorName: visitorName,
        vehiclePlate: vehiclePlate.isEmpty ? 'None' : vehiclePlate,
        visitDate: visitDate,
        arrivalTime: arrivalTime,
        purpose: purpose,
        accessCode: accessCode,
        status: 'active',
      );

      await _repository.createVisitorPass(newPass);
      Get.back(); // close the dialog/bottom sheet
      Get.snackbar('Success', 'Visitor pass generated successfully', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to generate pass: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
