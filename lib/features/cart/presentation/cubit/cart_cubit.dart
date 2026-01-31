import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/cart_model.dart';
import '../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  getCart() async {
    emit(GetCartLoading());
    final response = await CartRepo.getCart();
    if (response is CartModel) {
      emit(
        GetCartSuccess(
          response.data?.cartItems ?? [],
          response.data?.total ?? "",
        ),
      );
    } else {
      emit(GetCartError());
    }
  }
}
