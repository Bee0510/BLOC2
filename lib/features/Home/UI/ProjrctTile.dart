// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:bloc_2/features/Home/bloc/home_bloc.dart';
import 'package:bloc_2/features/Home/models/home_product_data.dart';
import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile(
      {super.key, required this.productData, required this.homeBloc});
  final productDataModel productData;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 10, 54, 52)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productData.imgUrl),
                    fit: BoxFit.contain)),
            height: 200,
            width: double.maxFinite,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productData.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(productData.description,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(
                              productData));
                        },
                        icon: Icon(Icons.heart_broken, color: Colors.white)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(
                              HomeProductCartButtonClickedEvent(productData));
                        },
                        icon: Icon(Icons.shopping_bag, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
