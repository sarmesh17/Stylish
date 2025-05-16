import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/screens/bottom_navigation/bottom_navigation.dart';
import 'package:stylish/screens/home_page/components/app_bar.dart';
import 'package:stylish/screens/home_page/components/category.dart';
import 'package:stylish/screens/home_page/components/search_bar.dart';
import 'package:stylish/util/app_colors.dart';

import 'components/product_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.very_light_gray,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            CustomAppBar(title: "Stylish",),
            CustomSearchBar(),
            SizedBox(height: 24),
            Category(),
            ProductCard(
              categories: [
                'beauty',
                'fragrances',
                'mens-shoes',
                'mens-watches',
                'womens-jewellery',
                'womens-watches',
                'skin-care'
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigation(),
    );
  }
}
