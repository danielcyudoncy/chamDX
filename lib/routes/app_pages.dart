import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

// Import Views
import '../views/splash_screen.dart';
import '../views/onboarding_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import '../views/resident_dashboard.dart';
import '../views/visitor_pass_screen.dart';
import '../views/facility_booking_screen.dart';
import '../views/emergency_sos_screen.dart';
import '../views/community_feed_screen.dart';
import '../views/notifications_screen.dart';
import '../views/select_estate_screen.dart';
import '../views/resident_profile_screen.dart';
import '../views/estate_chats_screen.dart';
import '../views/payments_screen.dart';
import '../views/app_settings_screen.dart';
import '../views/security_scanner_screen.dart';
import '../views/admin_desktop_dashboard.dart';
import '../views/admin_analytics_screen.dart';
import '../views/forgot_password_screen.dart';

class PlaceholderView extends StatelessWidget {
  final String title;
  const PlaceholderView(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Screen: $title')),
    );
  }
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.selectEstate, page: () => const SelectEstateScreen()),
    GetPage(name: AppRoutes.residentDashboard, page: () => const ResidentDashboard()),
    GetPage(name: AppRoutes.facilityBooking, page: () => const FacilityBookingScreen()),
    GetPage(name: AppRoutes.visitorPass, page: () => const VisitorPassScreen()),
    GetPage(name: AppRoutes.emergencySos, page: () => const EmergencySosScreen()),
    GetPage(name: AppRoutes.residentProfile, page: () => const ResidentProfileScreen()),
    GetPage(name: AppRoutes.communityFeed, page: () => const CommunityFeedScreen()),
    GetPage(name: AppRoutes.notifications, page: () => const NotificationsScreen()),
    GetPage(name: AppRoutes.estateChats, page: () => const EstateChatsScreen()),
    GetPage(name: AppRoutes.payments, page: () => const PaymentsScreen()),
    GetPage(name: AppRoutes.appSettings, page: () => const AppSettingsScreen()),
    GetPage(name: AppRoutes.securityScanner, page: () => const SecurityScannerScreen()),
    GetPage(name: AppRoutes.adminDashboard, page: () => const AdminDesktopDashboard()),
    GetPage(name: AppRoutes.adminAnalytics, page: () => const AdminAnalyticsScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
  ];
}
