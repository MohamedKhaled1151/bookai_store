import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_helper.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:bookia/features/home/data/models/sliders_models.dart';

class HomeRepo {
  static getSliders() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiConstants.sliders,
      );
      if (response?.statusCode == 200) {
        return SlidersModels.fromJson(response?.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static getBestSeller() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiConstants.bestSeller,
      );
      if (response?.statusCode == 200) {
        return BestSeller.fromJson(response?.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static addToCart(int productId) async {
    try {
      final response = await DioHelper.postRequest(
        endPoint: ApiConstants.addToCart,
        withToken: true,
        data: {"product_id": productId},
      );
      if (response?.statusCode == 201) {
        return response?.data["massage"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
