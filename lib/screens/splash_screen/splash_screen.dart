import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        context.go(AppRoutes.onBoardingScreens);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 125, height: 100),
            SizedBox(width: 12),
            Text(
              'Stylish',
              style: TextStyle(
                fontSize: 40,
                color: AppColors.vividPink,
                fontFamily: 'LibreCaslonText',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
