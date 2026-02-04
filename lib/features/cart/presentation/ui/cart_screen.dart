import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/make_order/presentation/ui/make_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(" My Cart", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartLoading) {
              return LinearProgressIndicator();
            } else if (state is GetCartSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartItem(
                        item: state.books[index],
                        onTap: () {
                          context.read<CartCubit>().removeFromCart(
                            state.books[index].itemId.toString(),
                          );
                        },
                        incrrednTap: () {
                          context.read<CartCubit>().updateCart(
                            state.books[index].itemId ?? 0,
                            (state.books[index].itemQuantity! + 1),
                          );
                        },
                        decrresonTap: () {
                          if (state.books[index].itemQuantity! > 0) {
                            context.read<CartCubit>().updateCart(
                              state.books[index].itemId ?? 0,
                              state.books[index].itemQuantity! - 1,
                            );
                          }
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.lightGray),
                      itemCount: state.books.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total :",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        state.total,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AppButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakeOrderScreen(),
                        ),
                      );
                    },
                    titleButton: "Checkout",
                    backgroundButton: AppColors.mainColor,
                  ),
                ],
              );
            } else {
              return Text("Error");
            }
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartItems item;
  final void Function()? onTap;
  final void Function()? incrrednTap;
  final void Function()? decrresonTap;
  const CartItem({
    super.key,
    required this.item,
    this.onTap,
    this.incrrednTap,
    this.decrresonTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            item.itemProductImage ?? "",
            width: 110.w,
            height: 118.h,
          ),
        ),

        SizedBox(width: 20.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.itemProductName ?? "",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.darkGray),
              ),
              SizedBox(height: 10.h),
              Text(item.itemProductPrice.toString() ?? "0"),
              SizedBox(height: 25.h),
              Row(
                children: [
                  InkWell(
                    onTap: incrrednTap,
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,

                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(width: 15.w),

                  Text(item.itemQuantity.toString() ?? "0"),
                  SizedBox(width: 15.w),
                  InkWell(
                    onTap: decrresonTap,
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,

                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Icon(Icons.remove, size: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(onTap: onTap, child: Icon(Icons.close)),
      ],
    );
  }
}
