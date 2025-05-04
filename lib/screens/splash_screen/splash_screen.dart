import 'package:flutter/material.dart';
import 'package:stylish/util/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
