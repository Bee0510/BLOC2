// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:bloc_2/features/Cart/UI/Cart.dart';
import 'package:bloc_2/features/Home/UI/ProjrctTile.dart';
import 'package:bloc_2/features/Home/bloc/home_bloc.dart';
import 'package:bloc_2/features/Wishlist/UI/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigationToCartPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPag()));
        } else if (state is HomeNavigationToWishListPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistPage()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item in Wishlist')));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item in Cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

            break;
          case HomeLoadedSuccessState:
            final succesState = state as HomeLoadedSuccessState;
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 10, 10, 10),
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Home'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigationEvent());
                      },
                      icon: Icon(Icons.heart_broken)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigationEvent());
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              ),
              body: ListView.builder(
                  itemCount: succesState.products.length,
                  itemBuilder: (context, index) {
                    return ProjectTile(
                      productData: succesState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );
            break;
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('error'),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
