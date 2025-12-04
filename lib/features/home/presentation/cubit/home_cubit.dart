import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/sliders_models.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/best_seller_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getSlider() async {
    emit(GetSliderLoading());
    final response = await HomeRepo.getSliders();
    if (response == null) {
      emit(GetSliderError());
    } else {
      if (response is SlidersModels) {
        emit(GetSliderSuccess(response.data?.sliders));
      }
    }
  }

  getBestSeller() async {
    emit(GetBestSellerLoading());
    final response = await HomeRepo.getBestSeller();
    if (response is BestSeller) {
      emit(GetBestSellerSuccess(response.data?.products));
    } else {
      emit(GetBestSellerError());
    }
  }

  addToCart(int productId) async {
    emit(AddToCartLoadingState());
    final response = await HomeRepo.addToCart(productId);
    if (response != null) {
      emit(AddToCartSuccessState(response));
    } else {
      emit(AddToCartErrorState());
    }
  }
}
