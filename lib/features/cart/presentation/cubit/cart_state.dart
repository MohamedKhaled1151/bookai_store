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

final class RemoveFromCartSuccess extends CartState {
  final String massage;

  RemoveFromCartSuccess({required this.massage});
}

final class RemoveFromCartError extends CartState {}

final class RemoveFromCarLoding extends CartState {}

final class UpdateCartSuccess extends CartState {}

final class UpdateCartError extends CartState {}

final class UpdateCarLoding extends CartState {}
