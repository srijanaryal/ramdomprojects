import 'package:blocs/shopping_cart/model/shopping_cart_model.dart';

import '../api/api_provider.dart';

class ShoppingCartRepository {
  final _apiProvider = ApiProvider();

  Future<List<ShoppingCartModel>> getShoppingItems() async {
    return _apiProvider.getShoppingItems();
  }
}