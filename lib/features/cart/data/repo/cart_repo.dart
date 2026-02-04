import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_helper.dart';
import 'package:bookia/features/cart/data/models/cart_model.dart';

class CartRepo {
  static getCart() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiConstants.cart,

        withToken: true,
      );

      if (response?.statusCode == 200) {
        return CartModel.fromJson(response?.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static removeFromCart(String id) async {
    try {
      final response = await DioHelper.postRequest(
        endPoint: ApiConstants.removeFromCart,
        data: {"cart_item_id": id},
      );
      if (response?.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static updateCart({required int id, required int quantity}) async {
    try {
      final response = await DioHelper.postRequest(
        endPoint: ApiConstants.updateCart,
        data: {"cart_item_id": id, "quantity": quantity},
      );
      if (response?.statusCode == 201) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
