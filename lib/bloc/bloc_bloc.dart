// ignore_for_file: depend_on_referenced_packages, unused_field, prefer_final_fields

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';
part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectiveSubscription;

  BlocBloc() : super(BlocInitial()) {
    on<BlocOnEvent>((event, emit) => emit(BlocOnState()));
    on<BlocOffEvent>((event, emit) => emit(BlocOffState()));

    _connectiveSubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(BlocOnEvent());
      } else {
        add(BlocOffEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectiveSubscription?.cancel();
    return super.close();
  }
}
