import 'dart:developer' as developer;

import 'package:blocs/shopping_cart/model/shopping_cart_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static const shoppingHomeUrl = 'https://fakestoreapi.com/products';

  final List<ShoppingCartModel> _shoppingCart = [];

  Future<List<ShoppingCartModel>> getShoppingItems() async {
    try {
      Response response = await _dio.get(shoppingHomeUrl);
      print('API Response Data: ${response.data}');

      _shoppingCart.addAll(
          List.from(response.data).map((e) => ShoppingCartModel.fromJson(e)));
      return _shoppingCart;
    } catch (e) {
      developer.log(e.toString());
      return [];
    }
  }
}
