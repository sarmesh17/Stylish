import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/home_page/components/app_bar.dart';
import 'package:stylish/screens/home_page/components/product_card.dart';

class MensWear extends ConsumerWidget {
  const MensWear({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(title: "Men's Wear",),
            ProductCard(categories: ['mens-shirts']),
          ],
        ),
      ),
    );
  }
}
