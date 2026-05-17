import 'package:get/get.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;

  void login(String email, String password) async {
    isLoading.value = true;
    // Mock network delay
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = true;
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.residentDashboard);
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}
