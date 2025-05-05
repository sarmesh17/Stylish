import 'package:flutter/material.dart';
import 'package:stylish/screens/on_boarding_screen/components/page_view_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                  fontFamily: "Montserrat-ExtraBold",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              Text(
                '/3',
                style: TextStyle(
                  fontFamily: "Montserrat-ExtraBold",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fashion_shop_img.png',
                  width: 400,
                  height: 350,
                ),
                SizedBox(height: 16),
                Text(
                  'Choose Products',
                  style: TextStyle(
                    fontSize: 29,
                    fontFamily: 'Montserrat-ExtraBold',
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat-ExtraBold',
                    letterSpacing: 2.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
