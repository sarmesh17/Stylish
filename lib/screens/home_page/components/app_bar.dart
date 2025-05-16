import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/util/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  String title;
   CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title,style: TextStyle(fontFamily: AppFonts.montserrat),),
        centerTitle: true,
        actions: [
          ClipOval(
            child: Image.asset(
              'assets/images/user_profile.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
        leading: Image.asset('assets/images/ic_menu.png', width: 40, height: 40),
      ),
    );
  }
}
