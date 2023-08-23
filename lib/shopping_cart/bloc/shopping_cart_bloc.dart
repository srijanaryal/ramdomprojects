import 'package:bloc/bloc.dart';
import 'package:blocs/shopping_cart/model/shopping_cart_model.dart';
import 'package:blocs/shopping_cart/repository/shopping_cart_repository.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    final ShoppingCartRepository shoppingCartRepository =
        ShoppingCartRepository();
    on<ShoppingCartEvent>((event, emit) async {
      try {
        emit(ShoppingCartLoading());
        final shoppingCartItems =
            await shoppingCartRepository.getShoppingItems();

        emit(ShoppingCartLoaded(shoppingCartItems));
      } catch (e) {
        emit(ShoppingCartError(message: e.toString()));
      }
    });
  }
}
