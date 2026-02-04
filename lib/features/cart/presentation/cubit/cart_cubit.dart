import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/cart_model.dart';
import '../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  getCart({bool withLoading = true}) async {
    if (withLoading) {
      emit(GetCartLoading());
    }
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

  removeFromCart(String id) async {
    emit(RemoveFromCarLoding());
    final response = await CartRepo.removeFromCart(id);

    if (response == null) {
      emit(RemoveFromCartError());
    } else {
      getCart(withLoading: false);
      emit(RemoveFromCartSuccess(massage: "Product Removed From Cart"));
    }
  }

  updateCart(int id, int quantity) async {
    emit(UpdateCarLoding());
    final response = await CartRepo.updateCart(id: id, quantity: quantity);
    if (response == null) {
      emit(UpdateCartError());
    } else {
      getCart();
    }
  }
}
