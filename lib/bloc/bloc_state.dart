part of 'bloc_bloc.dart';

@immutable
abstract class BlocState {}

class BlocInitial extends BlocState {}

class BlocOnState extends BlocState {}

class BlocOffState extends BlocState {}
