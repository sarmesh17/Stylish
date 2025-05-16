import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/providers/product_provider.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_routes.dart';

import '../../../util/app_fonts.dart';

class ProductCard extends ConsumerWidget {
  final List<String> categories;

  const ProductCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(fetchProductProvider);

    return productAsync.when(
      data: (productResponse) {
        final products =
            productResponse.products
                ?.where(
                  (product) => categories.contains(product.category)
                      // product.category == 'beauty' ||
                      // product.category == 'fragrances' ||
                      // product.category == 'mens-shirts' ||
                      // product.category == 'mens-shoes' ||
                      // product.category == 'mens-watches' ||
                      // product.category == 'womens-dresses' ||
                      // product.category == 'womens-jewellery',
                )
                .toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.57,
            ),
            itemBuilder: (BuildContext context, int index) {
              final product = products?[index];

              return GestureDetector(
                onTap: (){
                  context.push(AppRoutes.productDetailScreen, extra: product);
                },
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          color: AppColors.very_light_blue,
                          child: Image.network(
                            product?.thumbnail ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product?.title ?? "No Title",
                              style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: AppFonts.montserrat_Medium,fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product?.description ?? "No description",
                              style: const TextStyle(fontFamily: AppFonts.montserrat_regular,fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all( 8.0),
                            child: Text(
                              "₹${product?.price?.toStringAsFixed(0)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontFamily: AppFonts.montserrat_Medium,
                                fontSize: 14
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                            child: Row(
                              children: List.generate(5, (index) {
                                double rating = product?.rating ?? 0;
                                if (index < rating.floor()) {
                                  return const Icon(Icons.star, color: Colors.amber, size: 16);
                                } else if (index < rating && rating - index >= 0.5) {
                                  return const Icon(Icons.star_half, color: Colors.amber, size: 16);
                                } else {
                                  return const Icon(Icons.star_border, color: Colors.amber, size: 16);
                                }
                              } ),

                            ),
                          ),


                        ],
                      ),


                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        print(stackTrace.toString());
        return Center(child: Text("Error: ${error.toString()}"));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
