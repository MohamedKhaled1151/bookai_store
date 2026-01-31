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
}
