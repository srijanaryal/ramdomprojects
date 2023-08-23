import 'package:blocs/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:blocs/shopping_cart/screen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ShoppingCartBloc()..add(GetShoppingCartItems()),
            child: const ShoppingHome()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ShoppingHome(),
      ),
    );
  }
}
