import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_2/features/Cart/models/cartItem.dart';
import 'package:bloc_2/features/Home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(CcartInitialStateEvent);
    on<CartRemoveFromCart>(cartRemoveFromCart);
  }

  FutureOr<void> CcartInitialStateEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList));
  }

  FutureOr<void> cartRemoveFromCart(
      CartRemoveFromCart event, Emitter<CartState> emit) {
    cartList.remove(event.productData);
    emit(CartSuccessState(cartList));
  }
}
