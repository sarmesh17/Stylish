
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/models/product_model.dart';

part 'cart_provider.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart{

  @override
  List<ProductModel> build() => [];

  void addProduct(ProductModel product){
   
   state  =[...state,product];

  }

  
}