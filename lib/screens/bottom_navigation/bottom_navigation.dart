import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_routes.dart';

final _selectedIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(_selectedIndexProvider);

    return SizedBox(
      height: 90, // enough space to show both FAB and nav bar
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // 1️⃣ BottomAppBar goes first (in the back)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildNavItem(
                          Icons.home,
                          'Home',
                          0,
                          selectedIndex,
                          ref,
                          context
                        ),
                        const SizedBox(width: 30),
                        _buildNavItem(
                          Icons.favorite_border,
                          'Wishlist',
                          1,
                          selectedIndex,
                          ref,
                          context
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _buildNavItem(
                          Icons.search,
                          'Search',
                          3,
                          selectedIndex,
                          ref,
                          context
                        ),
                        const SizedBox(width: 30),
                        _buildNavItem(
                          Icons.settings,
                          'Setting',
                          4,
                          selectedIndex,
                          ref,
                          context
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2️⃣ FAB on top
          Positioned(
            top: -25,
            child: FloatingActionButton(
              backgroundColor: AppColors.vividPink,
              onPressed: () {
                ref.read(_selectedIndexProvider.notifier).state = 2;
                context.push(AppRoutes.checkoutScreen);
              },
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    int selectedIndex,
    WidgetRef ref,
    BuildContext context,
  ) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        ref.read(_selectedIndexProvider.notifier).state = index;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (selectedIndex == 0) {
                  context.push(AppRoutes.homeScreen);
                }
              },
              child: Icon(
                icon,
                color: isSelected ? AppColors.vividPink : Colors.black,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.vividPink : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
