import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/home_page/components/app_bar.dart';
import 'package:stylish/screens/home_page/components/product_card.dart';

class WomensWear extends ConsumerWidget {
  const WomensWear({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(title: "Women's Wear",),
            ProductCard(categories: ['womens-dresses','tops']),
          ],
        ),
      ),
    );
  }
}
