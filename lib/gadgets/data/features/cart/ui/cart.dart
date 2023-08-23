// import 'package:blocs/gadgets/data/features/cart/bloc/cart_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   final CartBloc cartBloc = CartBloc();

//   @override
//   void initState() {
//     cartBloc.cartIntialEvent(CartInitial(), emit)
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('CartpAGE')),
//       body: BlocConsumer<CartBloc, CartState>(
//         bloc: cartBloc,
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Container();
//         },
//       ),
//     );
//   }
// }
