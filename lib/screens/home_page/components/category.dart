import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/util/app_fonts.dart';
import 'package:stylish/util/app_routes.dart';

class Category extends ConsumerWidget {
  const Category({super.key});

  // Sample data for the categories
  final List<Map<String, String>> categories = const [
    {'image': 'assets/images/mens_fashion.png', 'label': 'Mens Wear'},
    {'image': 'assets/images/womens_wear.png', 'label': "Women's Wear"},
    {
      'image': 'assets/images/women_accessories.png',
      'label': "Women's Accessories",
    },
    {
      'image': 'assets/images/mens_accessories.png',
      'label': 'Mens Accessories.',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120, // enough height for image + text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (category['label'] == 'Mens Wear') {
                      context.push(AppRoutes.mensWearScreen);
                    } else if (category['label'] == "Women's Wear") {
                      context.push(AppRoutes.womensWearScreen);
                    } else if (category['label'] == "Women's Accessories") {
                      context.push(AppRoutes.womensAccessoriesScreen);
                    } else if (category['label'] == 'Mens Accessories.'){
                      context.push(AppRoutes.mensAccessoriesScreen);
                    }
                  },
                  child: ClipOval(
                    child: Image.asset(
                      category['image']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category['label']!,
                  style: const TextStyle(
                    fontFamily: AppFonts.montserrat_Medium,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
