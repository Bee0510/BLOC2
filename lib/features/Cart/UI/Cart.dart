// ignore_for_file: prefer_const_constructors

import 'package:bloc_2/features/Cart/UI/CartListTile.dart';
import 'package:bloc_2/features/Cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPag extends StatefulWidget {
  const CartPag({super.key});

  @override
  State<CartPag> createState() => _CartPagState();
}

class _CartPagState extends State<CartPag> {
  final CartBloc cartbloc = CartBloc();
  @override
  void initState() {
    cartbloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Items')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartbloc,
        listenWhen: (Previous, current) => State is CartActionState,
        buildWhen: (Previous, current) => State is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.CartItems.length,
                  itemBuilder: (context, index) {
                    return CartListTile(
                        productData: successState.CartItems[index],
                        cartBloc: cartbloc);
                  });

              break;
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
