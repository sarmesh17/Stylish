import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_fonts.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot",
                style: TextStyle(fontSize: 36, fontFamily: AppFonts.montserrat),
              ),
              Text(
                "password?",
                style: TextStyle(fontSize: 36, fontFamily: AppFonts.montserrat),
              ),

              SizedBox(height: 36),

              // email text-field
              TextField(
                controller: email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ), // Increase vertical padding

                  hintText: 'Username or Email',
                  filled: true,
                  fillColor: AppColors.grey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/images/User.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              SizedBox(height: 32),

              Text(
                "* We will send you a message to set or reset\n your new password",
                style: TextStyle(fontFamily: AppFonts.montserrat_regular),
              ),

              // Login Button
              SizedBox(height: 78),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: AppColors.vividPink,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat_regular,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
