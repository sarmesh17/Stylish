import 'package:go_router/go_router.dart';
import 'package:stylish/screens/auth/login_screen.dart';
import 'package:stylish/screens/auth/signup_screen.dart';
import 'package:stylish/screens/on_boarding_screen/components/page_view_indicator.dart';
import 'package:stylish/screens/splash_screen/splash_screen.dart';
import 'package:stylish/util/app_routes.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoardingScreens,
      builder: (context, state) => PageViewIndicator(),
    ),
  

    GoRoute(
      path: AppRoutes.loginScreen,
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: AppRoutes.signupScreen,
      builder: (context, state) => SignupScreen(),
    ),
  ],
);
