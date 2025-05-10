import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:stylish/screens/on_boarding_screen/on_boarding_screen2.dart';
import 'package:stylish/screens/on_boarding_screen/on_boarding_screen3.dart';
import 'package:stylish/util/app_routes.dart';

class PageViewIndicator extends ConsumerStatefulWidget {
  const PageViewIndicator({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PageViewIndicator();
  }
}

final currentPageProvider = StateProvider((ref) => 0);

class _PageViewIndicator extends ConsumerState<PageViewIndicator> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                ref.read(currentPageProvider.notifier).state = index;
              },
              children: [
                OnBoardingScreen(),
                OnBoardingScreen2(),
                OnBoardingScreen3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ✅ Page Indicator Row
                Row(
                  children: List.generate(3, (index) {
                    bool isActive = index == currentPage;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 30 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isActive ? Color(0xFF0E162C) : Color(0xFFD1D5DB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),

                // ✅ "Get Started" button with layout preserved
                Visibility(
                  visible: currentPage == 2,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: () {

                     context.go(AppRoutes.loginScreen);
                     
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E162C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
