// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:bloc_2/bloc/bloc_bloc.dart';
import 'package:bloc_2/cubit/internet_cubit.dart';
import 'package:bloc_2/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
