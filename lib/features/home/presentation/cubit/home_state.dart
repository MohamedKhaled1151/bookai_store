part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetSliderLoading extends HomeState {}

final class GetSliderSuccess extends HomeState {
  final List<Sliders>? sliders;

  GetSliderSuccess(this.sliders);
}

final class GetSliderError extends HomeState {}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerSuccess extends HomeState {
  final List<Products>? books;

  GetBestSellerSuccess(this.books);
}

final class GetBestSellerError extends HomeState {}

final class AddToCartLoadingState extends HomeState {}

final class AddToCartSuccessState extends HomeState {
  final String massage;

  AddToCartSuccessState(this.massage);
}

final class AddToCartErrorState extends HomeState {}
