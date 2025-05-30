import 'package:get/get.dart';
import 'package:tjw_ue/ui/views/dashboard/dashboard_screen.dart';
import 'package:tjw_ue/ui/views/splash/splash_screen.dart';


class AppRoutes {
  static const String splash = '/';
  static const String loginScreen = '/login';
  static const String dashboardScreen = '/dashboard';

  // Define the pages and their routes
  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: loginScreen,
    //   page: () => LoginScreen(),
    //   transition: Transition.fadeIn,
    // ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      transition: Transition.rightToLeft,
    ),
    // Add more pages here
  ];
}
