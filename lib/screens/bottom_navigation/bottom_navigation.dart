import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_routes.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
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
                          context: context,
                          ref: ref,
                          icon: Icons.home,
                          label: 'Home',
                          index: 0,
                          selectedIndex: selectedIndex,
                          route: AppRoutes.homeScreen,
                        ),
                        const SizedBox(width: 30),
                        _buildNavItem(
                          context: context,
                          ref: ref,
                          icon: Icons.favorite_border,
                          label: 'Wishlist',
                          index: 1,
                          selectedIndex: selectedIndex,
                          route: AppRoutes.wishListScreen,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _buildNavItem(
                          context: context,
                          ref: ref,
                          icon: Icons.search,
                          label: 'Search',
                          index: 3,
                          selectedIndex: selectedIndex,
                          route: AppRoutes.searchScreen,
                        ),
                        const SizedBox(width: 30),
                        _buildNavItem(
                          context: context,
                          ref: ref,
                          icon: Icons.settings,
                          label: 'Setting',
                          index: 4,
                          selectedIndex: selectedIndex,
                          route: AppRoutes.settingsScreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -25,
            child: FloatingActionButton(
              backgroundColor: AppColors.vividPink,
              onPressed: () {
                ref.read(selectedIndexProvider.notifier).state = 2;
                context.push(AppRoutes.checkoutScreen);
              },
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required WidgetRef ref,
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
    required String route,
  }) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).state = index;
        context.push(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.vividPink : Colors.black,
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