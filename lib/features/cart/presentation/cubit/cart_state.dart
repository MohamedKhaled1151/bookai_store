part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartSuccess extends CartState {
  final List<CartItems> books;
  final String total;

  GetCartSuccess(this.books, this.total);
}

final class GetCartLoading extends CartState {}

final class GetCartError extends CartState {}
