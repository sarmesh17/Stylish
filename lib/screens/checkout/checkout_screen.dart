import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/product_model.dart';
import 'package:stylish/providers/cart_provider/cart_provider.dart';
import 'package:stylish/providers/location/location_provider.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_fonts.dart';

class CheckOutScreen extends ConsumerStatefulWidget {
  const CheckOutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CheckOutScreen();
  }
}

class _CheckOutScreen extends ConsumerState<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final loaction = ref.watch(userLocationProvider);
    final cart = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(fontFamily: AppFonts.montserrat_Medium),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Text(
                'Delivery Address',
                style: TextStyle(fontFamily: AppFonts.montserrat_Medium),
              ),
            ],
          ),

          SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: Card(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address:'),

                    SizedBox(height: 4),
                    loaction.when(
                      data: (location) {
                        return Text(
                          location,
                          style: TextStyle(
                            fontFamily: AppFonts.montserrat_Medium,
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text('Location unavailable');
                      },
                      loading: () => LinearProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 16),
          Text(
            'Shopping List',
            style: TextStyle(fontFamily: AppFonts.montserrat),
          ),
          Divider(),

          // cart + total amount
          Column(
            children: [
              ...cart.map((product) => buildCartItem(product)).toList(),

              // Total Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Order (${cart.length}) :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${cart.fold(0.0, (double total, item) => total + (item.price! * (1 - item.discountPercentage! / 100))).toStringAsFixed(0)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.vividPink,
              foregroundColor: Colors.white,
            ),
            child: Text(
              "Proceed To Purchase",
              style: TextStyle(
                fontFamily: AppFonts.montserrat_regular,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(ProductModel product) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.thumbnail!),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      for (int i = 1; i <= 5; i++)
                        Icon(
                          i <= product.rating!.floor()
                              ? Icons.star
                              : (i - product.rating! < 1
                                  ? Icons.star_half
                                  : Icons.star_border),
                          color: Colors.amber,
                          size: 16,
                        ),
                      const SizedBox(width: 5),
                      Text(product.rating!.toStringAsFixed(1)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "₹${(product.price! * (1 - product.discountPercentage! / 100)).toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontFamily: AppFonts.montserrat_Medium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "₹${product.price!.toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
