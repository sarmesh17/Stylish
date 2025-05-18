import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/providers/product_provider.dart';
import 'package:stylish/util/app_routes.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(fetchProductProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by product title',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: productAsync.when(
              data: (productResponse) {
                final products = productResponse.products ?? [];

                final filtered = products
                    .where((product) => (product.title ?? '')
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No products found'));
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final product = filtered[index];

                    return ListTile(
                      leading: Image.network(
                        product.thumbnail ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.title!),
                      subtitle: Text("₹${product.price}"),
                      onTap: () {
                        context.push(AppRoutes.productDetailScreen, extra: product);
                      },
                    );
                  },
                );
              },
              error: (e, s) => Center(child: Text('Error: $e')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
