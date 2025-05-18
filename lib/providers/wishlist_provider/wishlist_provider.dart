
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/models/product_model.dart';

part 'wishlist_provider.g.dart';


@Riverpod(keepAlive: true)
class WishList extends _$WishList{
 
 @override
 List<ProductModel> build () => [];

 void toggleWishListItem(ProductModel product) {
    if (state.contains(product)) {
      state = state.where((item) => item != product).toList();
    } else {
      state = [...state, product];
    }
  }


 void addWishListItem(ProductModel product){

   state= [...state,product];

 }

 void removeWishListItem(ProductModel product){

  state = state.where((p)=> p.id != product.id).toList();
 }

}