import 'package:blocs/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:blocs/shopping_cart/model/shopping_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ShoppingHome extends StatefulWidget {
  const ShoppingHome({Key? key}) : super(key: key);

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Home'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildShoppingHome(),
      ),
    );
  }

  Widget _buildShoppingHome() {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        if (state is ShoppingCartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ShoppingCartLoaded) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.shoppingCartModel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = state.shoppingCartModel[index];
                return ShoppingCartTile(shoppingCartModel: data);
              });
        }
        return const Center(child: Text('items loading hopefully :)'));
      },
    );
  }
}


class ShoppingCartTile extends StatelessWidget {
  final ShoppingCartModel shoppingCartModel;
  const ShoppingCartTile({Key? key, required this.shoppingCartModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.02)),
      height: size.height,
      width: size.width,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ImageWidget(imageUrl: shoppingCartModel.image!),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('\$ ${shoppingCartModel.price!.toString()}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(shoppingCartModel.title!,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        imageUrl,
        height: 130,
        width: 130,
      ),
    );
  }
}



