part of 'bloc_bloc.dart';

@immutable
abstract class BlocEvent {}

class BlocOnEvent extends BlocEvent {}

class BlocOffEvent extends BlocEvent {}
