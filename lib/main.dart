import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/on_boarding_screen/components/page_view_indicator.dart';
import 'package:stylish/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:stylish/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageViewIndicator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
