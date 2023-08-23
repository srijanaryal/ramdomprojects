// import 'package:blocs/gadgets/data/features/cart/ui/cart.dart';
// import 'package:blocs/gadgets/data/features/home/bloc/home_bloc.dart';
// import 'package:blocs/gadgets/data/features/home/ui/product_tile_widget.dart';
// import 'package:blocs/gadgets/data/features/wishlist/ui/wishlist_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     homeBloc.add(HomeInitialEvent());
//     super.initState();
//   }

//   final HomeBloc homeBloc = HomeBloc();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       bloc: homeBloc,
//       listenWhen: (previous, current) => current is HomeActionState,
//       buildWhen: (previous, current) => current is! HomeActionState,
//       listener: (context, state) {
//         if (state is HomeNavigateToCartPageActionState) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => const Cart()));
//         } else if (state is HomeNavigateToWishlistPageActionState) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const WishList()));
//         } else if (state is HomeProductItemCartedActionState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('ITEM ADDED TO CART')));
//         } else if (state is HomeProductItemWishlistedActionState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('ITEM ADDED TO Wishlist')));
//         }
//       },
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case HomeLoadingState:
//             return const Scaffold(
//               body: Center(
//                   child: CircularProgressIndicator(
//                 color: Colors.red,
//               )),
//             );
//           case HomeLoadedSuccessState:
//             final successState = state as HomeLoadedSuccessState;

//             return Scaffold(
//                 appBar: AppBar(
//                   title: const Text('Gadgets Hub'),
//                   actions: [
//                     IconButton(
//                         onPressed: () {
//                           homeBloc.add(HomeCartButtonNavigateEvent());
//                         },
//                         icon: const Icon(Icons.shopping_bag)),
//                     IconButton(
//                         onPressed: () {
//                           // homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: ));
//                         },
//                         icon: const Icon(Icons.favorite)),
//                   ],
//                 ),
//                 body: ListView.builder(
//                     itemCount: successState.products.length,
//                     itemBuilder: (context, index) {
//                       return ProductTileWidget(
//                           homeBloc: homeBloc,
//                           productDataModel: successState.products[index]);
//                     }));

//           case HomeErrorState:
//             return const Scaffold(
//               body: Center(child: Text('Error')),
//             );
//           default:
//             return const SizedBox();
//         }
//       },
//     );
//   }
// }
