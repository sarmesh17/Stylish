import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/models/product_model.dart';
import 'package:dio/dio.dart';

part 'product_provider.g.dart';

final dio = Dio();

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
); // provider provide single instance

@riverpod
Future<ProductModel> fetchProduct(FetchProductRef ref) async {
  try {
    final response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception(
        'Failed to fetch products. Status: ${response.statusCode}',
      );
    }
  } catch (e) {
    throw Exception('Unexpected error : $e');
  }
}
