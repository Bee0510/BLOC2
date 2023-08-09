// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:bloc_2/cubit/internet_cubit.dart';

import './bloc/bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Connected',
                  style: TextStyle(color: Colors.green),
                ),
                backgroundColor: Colors.grey[900],
              ));
            } else if (state == InternetState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Disconnected',
                  style: TextStyle(color: Colors.red),
                ),
                backgroundColor: Colors.grey[900],
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Loading',
                  style: TextStyle(color: Colors.yellow),
                ),
                backgroundColor: Colors.grey[900],
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState.gained) {
              return Text('Connected');
            } else if (state == InternetState.lost) {
              return Text('Disconnected');
            } else {
              return Text('Loading');
            }
          },
        ),
      )),
    );
  }
}
