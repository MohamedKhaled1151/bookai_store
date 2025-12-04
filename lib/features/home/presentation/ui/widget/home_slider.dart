import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../gen/assets.gen.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, current) =>
          current is GetSliderSuccess ||
          current is GetSliderLoading ||
          current is GetSliderError,
      builder: (context, state) {
        if (state is GetSliderLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetSliderSuccess) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.h,

                  autoPlay: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                items: state.sliders?.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: NetworkImage(i.image ?? ""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 14.h),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,

                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.mainColor,
                ),
              ),
            ],
          );
        } else {
          return Text("Error");
        }
      },
    );
  }
}
