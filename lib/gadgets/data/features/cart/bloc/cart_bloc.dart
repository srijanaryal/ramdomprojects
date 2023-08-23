// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:blocs/gadgets/data/data/cart_items.dart';
// import 'package:blocs/gadgets/data/features/home/model/home_product_data_model.dart';
// import 'package:equatable/equatable.dart';

// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartInitial()) {
//     on<CartIntialEvent>(cartIntialEvent);
//   }

//   FutureOr<void> cartIntialEvent(
//       CartIntialEvent event, Emitter<CartState> emit) {
//     emit(CartSuccessState(cartItems: cartItems));
//   }
// }
