import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/util/app_fonts.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 36, fontFamily: AppFonts.montserrat),
              ),
              Text(
                "Back!",
                style: TextStyle(fontSize: 36, fontFamily: AppFonts.montserrat),
              ),

              TextField(controller: email, decoration: InputDecoration(prefixIcon: Image.asset()),),
            ],
          ),
        ),
      ),
    );
  }
}
