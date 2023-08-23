part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartState extends Equatable {
  const ShoppingCartState();

  @override
  List<Object> get props => [];
}

class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartLoading extends ShoppingCartState {}

class ShoppingCartLoaded extends ShoppingCartState {
  final List<ShoppingCartModel> shoppingCartModel;

  const ShoppingCartLoaded(this.shoppingCartModel);
}

class ShoppingCartError extends ShoppingCartState {
  final String message;
  const ShoppingCartError({required this.message});
}
