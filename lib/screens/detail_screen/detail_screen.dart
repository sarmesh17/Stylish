import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/product_model.dart';
import 'package:stylish/screens/detail_screen/components/image_slider.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_fonts.dart';

class DetailScreen extends ConsumerWidget {
  final ProductModel product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/ic_cart.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          ImageSlider(product: product),

          // title
          SizedBox(height: 28),
          Text(
            product.title!,
            style: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.montserrat_Medium,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: List.generate(5, (index) {
                double rating = product?.rating ?? 0;
                if (index < rating.floor()) {
                  return const Icon(Icons.star, color: Colors.amber, size: 16);
                } else if (index < rating && rating - index >= 0.5) {
                  return const Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: 16,
                  );
                } else {
                  return const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  );
                }
              }),
            ),
          ),

          // price + discount UI
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Discounted Price
                Text(
                  "₹${(product!.price! * (1 - (product.discountPercentage! / 100))).toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontFamily: AppFonts.montserrat_Medium,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),

                // Original Price (strikethrough)
                Text(
                  "₹${product.price!.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),

                // Discount Percentage
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "-${product.discountPercentage!.toStringAsFixed(0)}%",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //description
          SizedBox(height: 16),
          Text(
            'Product Deatils',
            style: TextStyle(
              fontSize: 18,
              fontFamily: AppFonts.montserrat_Medium,
            ),
          ),
          Text(
            product.description!,
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.montserrat_regular,
            ),
          ),

          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.very_light_pink,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivery in',
                  style: TextStyle(fontFamily: AppFonts.montserrat_Medium),
                ),
                Text(
                  '1 within Hour',
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 180),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.vividPink,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Go To Cart'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.vividPink,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Buy Now'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
