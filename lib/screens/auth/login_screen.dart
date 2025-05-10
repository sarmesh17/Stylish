import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/providers/auth_provider/auth_provider.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_fonts.dart';

final isVisibleProvider = StateProvider((ref) => false);

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isVisible = ref.watch(isVisibleProvider);
    final authState = ref.watch(authRepoProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 36, fontFamily: AppFonts.montserrat),
            ),
            Text(
              "Back!",
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

            // password text-field
            TextField(
              controller: password,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                hintText: 'Password',
                filled: true,
                fillColor: AppColors.grey,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/lock.png',
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

                suffixIcon: IconButton(
                  onPressed: () {
                    isVisible =
                        ref.read(isVisibleProvider.notifier).state = !isVisible;
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      isVisible
                          ? 'assets/images/visibility_eye.png'
                          : 'assets/images/off_visibility_eye.png',
                      width: 24,
                      height: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat_regular,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),

            // Login Button
            SizedBox(height: 78),
            ElevatedButton(
              onPressed: () async {
                final result = await authState.signIn(
                  email.text,
                  password.text,
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Login Successfull",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Invalid email or password",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: AppColors.vividPink,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontFamily: AppFonts.montserrat_regular,
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(height: 60),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text("- OR Continue with -"),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            authState.signInWithGoogle();
                          },
                          child: Image.asset(
                            'assets/images/google_icon.png',
                            width: 60,
                            height: 60,
                          ),
                        ),

                        SizedBox(width: 8),

                        Image.asset(
                          'assets/images/apple_icon.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(width: 8),

                        Image.asset(
                          'assets/images/facebook_icon.png',
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),

                    SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create An Account",
                          style: TextStyle(
                            fontFamily: AppFonts.montserrat_regular,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: AppFonts.montserrat_regular,
                            color: AppColors.vividPink,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.vividPink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
