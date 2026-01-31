import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widget/book_items.dart';
import 'package:bookia/features/home/presentation/ui/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Assets.logos.logoApp.path),

        leadingWidth: 100.w,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 25.h),
            HomeSlider(),
            SizedBox(height: 31.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Text(
                "Best Seller",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: 24.sp),
              ),
            ),
            SizedBox(height: 15.h),

            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is AddToCartLoadingState) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        Center(child: CircularProgressIndicator()),
                  );
                } else if (state is AddToCartSuccessState) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        state.massage,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (prev, current) =>
                      current is GetBestSellerSuccess ||
                      current is GetBestSellerLoading ||
                      current is GetBestSellerError,
                  builder: (context, state) {
                    if (state is GetBestSellerLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GetBestSellerSuccess) {
                      return GridView.builder(
                        padding: EdgeInsets.all(19.r),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.books?.length ?? 0,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .5,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                        ),

                        itemBuilder: (context, index) => BookItems(
                          books: state.books?[index],
                          addToCartOnTap: () {
                            context.read<HomeCubit>().addToCart(
                              state.books?[index].id ?? 0,
                            );
                          },
                        ),
                      );
                    } else {
                      return Text("Error");
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
