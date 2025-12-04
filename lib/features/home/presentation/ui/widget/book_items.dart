import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItems extends StatelessWidget {
  const BookItems({super.key, this.books, this.addToCartOnTap});
  final Products? books;
  final void Function()? addToCartOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                books?.image ?? "",
                fit: BoxFit.cover,
                height: 175.h,
                width: double.infinity,
              ),
            ),
          ),

          Text(
            books?.name ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 23.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹${books?.price}",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              InkWell(
                onTap: addToCartOnTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
