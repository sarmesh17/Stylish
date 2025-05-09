import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/auth/components/forgot_password.dart';
import 'package:stylish/screens/auth/login_screen.dart';
import 'package:stylish/screens/auth/signup_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
