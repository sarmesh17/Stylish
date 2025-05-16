import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/models/product_model.dart';
import 'package:dio/dio.dart';

part 'product_provider.g.dart';

final dio = Dio();

final logger=Logger();

@riverpod
Future<ProductResponse> fetchProduct(FetchProductRef ref) async {
  try {
    final response = await dio.get('https://dummyjson.com/products',queryParameters:{'limit': 0});

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.data);
    } else {
      throw Exception(
        'Failed to fetch products. Status: ${response.statusCode}',
      );
    }
  } catch (e) {
    throw Exception('Unexpected error : $e');
  }
}
