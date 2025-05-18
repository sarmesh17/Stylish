import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/models/product_model.dart';

final _currentPageProvider = StateProvider<int>((ref) => 0);

class ImageSlider extends ConsumerStatefulWidget {
  final ProductModel product;
  const ImageSlider({super.key, required this.product});

  @override
  ConsumerState<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends ConsumerState<ImageSlider> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }


  @override
  Widget build(BuildContext context) {
    ref.watch(_currentPageProvider);
    final images = widget.product.images ?? [];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 235,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      ref.read(_currentPageProvider.notifier).state = index;
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: images.length,
            effect: WormEffect(
              dotColor: Colors.grey.shade300,
              activeDotColor: Colors.red,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
