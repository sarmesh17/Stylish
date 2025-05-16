import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/home_page/components/app_bar.dart';
import 'package:stylish/screens/home_page/components/product_card.dart';

class MensAccessories extends ConsumerWidget {
  const MensAccessories({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(title: "Men's Accessories",),
            ProductCard(categories: ['mens-shoes','mens-watches','sunglasses']),
          ],
        ),
      ),
    );
  }
}
