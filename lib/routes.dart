import 'package:flutter/material.dart';
import 'screens/common/splash_screen.dart';
import 'screens/common/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup/signup_screen.dart';
import 'screens/auth/signup/role_selection_screen.dart';
import 'screens/auth/signup/student_signup_screen.dart';
import 'screens/auth/signup/houseowner_signup_screen.dart';
import 'screens/auth/signup/serviceprovider_signup_screen.dart';
import 'screens/auth/nid_verification_screen.dart';
import 'screens/dashboards/student_dashboard_screen.dart';
import 'screens/dashboards/houseowner_dashboard_screen.dart';
import 'screens/dashboards/serviceprovider_dashboard_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/house_booking/house_list_screen.dart';
import 'screens/house_booking/house_search_screen.dart';
import 'screens/house_booking/house_details_screen.dart';
import 'screens/house_booking/book_house_screen.dart';
import 'screens/service_ordering/service_list_screen.dart';
import 'screens/service_ordering/service_search_screen.dart';
import 'screens/service_ordering/service_details_screen.dart';
import 'screens/service_ordering/order_now_screen.dart';
import 'screens/tuition/tuition_list_screen.dart';
import 'screens/tuition/tuition_search_screen.dart';
import 'screens/tuition/tuition_details_screen.dart';
import 'screens/tuition/apply_tuition_screen.dart';
import 'screens/features/smart_search_screen.dart';
import 'screens/features/maps_screen.dart';
import 'screens/features/chat_screen.dart';
import 'screens/features/reviews_screen.dart';
import 'screens/features/emergency_screen.dart';
import 'screens/features/complaint_screen.dart';
import 'screens/common/notifications_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String roleSelection = '/role-selection';
  static const String studentSignup = '/student-signup';
  static const String houseonwerSignup = '/houseowner-signup';
  static const String serviceProviderSignup = '/serviceprovider-signup';
  static const String nidVerification = '/nid-verification';
  static const String studentDashboard = '/student-dashboard';
  static const String houseonwerDashboard = '/houseowner-dashboard';
  static const String serviceProviderDashboard = '/serviceprovider-dashboard';
  static const String profile = '/profile';
  static const String houseList = '/house-list';
  static const String houseSearch = '/house-search';
  static const String houseDetails = '/house-details';
  static const String bookHouse = '/book-house';
  static const String serviceList = '/service-list';
  static const String serviceSearch = '/service-search';
  static const String serviceDetails = '/service-details';
  static const String orderNow = '/order-now';
  static const String tuitionList = '/tuition-list';
  static const String tuitionSearch = '/tuition-search';
  static const String tuitionDetails = '/tuition-details';
  static const String applyTuition = '/apply-tuition';
  static const String smartSearch = '/smart-search';
  static const String maps = '/maps';
  static const String chat = '/chat';
  static const String reviews = '/reviews';
  static const String emergency = '/emergency';
  static const String complaint = '/complaint';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case roleSelection:
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
      case studentSignup:
        return MaterialPageRoute(builder: (_) => const StudentSignupScreen());
      case houseonwerSignup:
        return MaterialPageRoute(builder: (_) => const HouseownerSignupScreen());
      case serviceProviderSignup:
        return MaterialPageRoute(builder: (_) => const ServiceProviderSignupScreen());
      case nidVerification:
        return MaterialPageRoute(builder: (_) => const NidVerificationScreen());
      case studentDashboard:
        return MaterialPageRoute(builder: (_) => const StudentDashboardScreen());
      case houseonwerDashboard:
        return MaterialPageRoute(builder: (_) => const HouseownerDashboardScreen());
      case serviceProviderDashboard:
        return MaterialPageRoute(builder: (_) => const ServiceProviderDashboardScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case houseList:
        return MaterialPageRoute(builder: (_) => const HouseListScreen());
      case houseSearch:
        return MaterialPageRoute(builder: (_) => const HouseSearchScreen());
      case houseDetails:
        return MaterialPageRoute(
          builder: (_) => HouseDetailsScreen(
            houseId: settings.arguments as String? ?? '',
          ),
        );
      case bookHouse:
        return MaterialPageRoute(
          builder: (_) => BookHouseScreen(
            houseId: settings.arguments as String? ?? '',
          ),
        );
      case serviceList:
        return MaterialPageRoute(builder: (_) => const ServiceListScreen());
      case serviceSearch:
        return MaterialPageRoute(builder: (_) => const ServiceSearchScreen());
      case serviceDetails:
        return MaterialPageRoute(
          builder: (_) => ServiceDetailsScreen(
            serviceId: settings.arguments as String? ?? '',
          ),
        );
      case orderNow:
        return MaterialPageRoute(
          builder: (_) => OrderNowScreen(
            serviceId: settings.arguments as String? ?? '',
          ),
        );
      case tuitionList:
        return MaterialPageRoute(builder: (_) => const TuitionListScreen());
      case tuitionSearch:
        return MaterialPageRoute(builder: (_) => const TuitionSearchScreen());
      case tuitionDetails:
        return MaterialPageRoute(
          builder: (_) => TuitionDetailsScreen(
            tuitionId: settings.arguments as String? ?? '',
          ),
        );
      case applyTuition:
        return MaterialPageRoute(
          builder: (_) => ApplyTuitionScreen(
            tuitionId: settings.arguments as String? ?? '',
          ),
        );
      case smartSearch:
        return MaterialPageRoute(builder: (_) => const SmartSearchScreen());
      case maps:
        return MaterialPageRoute(builder: (_) => const MapsScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case reviews:
        return MaterialPageRoute(builder: (_) => const ReviewsScreen());
      case emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case complaint:
        return MaterialPageRoute(builder: (_) => const ComplaintScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
