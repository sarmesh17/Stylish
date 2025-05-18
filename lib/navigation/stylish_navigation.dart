import 'package:go_router/go_router.dart';
import 'package:stylish/models/product_model.dart';
import 'package:stylish/screens/auth/login_screen.dart';
import 'package:stylish/screens/auth/signup_screen.dart';
import 'package:stylish/screens/checkout/checkout_screen.dart';
import 'package:stylish/screens/detail_screen/detail_screen.dart';
import 'package:stylish/screens/home_page/components/mens_accessories/mens_accessories.dart';
import 'package:stylish/screens/home_page/components/mens_wear/mens_wear.dart';
import 'package:stylish/screens/home_page/components/womens_accessories/women_accessories.dart';
import 'package:stylish/screens/home_page/components/womens_wears/womens_wear.dart';
import 'package:stylish/screens/home_page/home_page.dart';
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

    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomePage(),
    ),

    GoRoute(
      path: AppRoutes.mensWearScreen,
      builder: (context, state) => MensWear(),
    ),
    GoRoute(
      path: AppRoutes.womensWearScreen,
      builder: (context, state) => WomensWear(),
    ),
    GoRoute(
      path: AppRoutes.womensAccessoriesScreen,
      builder: (context, state) => WomenAccessories(),
    ),
    GoRoute(
      path: AppRoutes.mensAccessoriesScreen,
      builder: (context, state) => MensAccessories(),
    ),

    GoRoute(
      path: AppRoutes.productDetailScreen,
      builder: (context, state) {
        final extra = state.extra;

        late final ProductModel product;

        if (extra is ProductModel) {
          product = extra;
        } else if (extra is Map<String, dynamic>) {
          product = ProductModel.fromJson(extra);
        } else {

        }

        return DetailScreen(product: product);
      },
    ),

    GoRoute(path: AppRoutes.checkoutScreen, builder: (context,state){
        return CheckOutScreen();
    })

  ],
);
