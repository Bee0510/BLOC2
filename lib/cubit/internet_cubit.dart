// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

enum InternetState { initial, gained, lost }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? InternetSubscription;

  InternetCubit() : super(InternetState.initial) {
    InternetSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.gained);
      } else {
        emit(InternetState.lost);
      }
    });
  }
  @override
  Future<void> close() {
    InternetSubscription?.cancel();
    return super.close();
  }
}
