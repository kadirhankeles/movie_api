import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class TrendingShimmer extends StatefulWidget {
  const TrendingShimmer({super.key});

  @override
  State<TrendingShimmer> createState() => _TrendingShimmerState();
}

class _TrendingShimmerState extends State<TrendingShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 45.h,
        width: 100.w,
        child: Shimmer.fromColors(
          baseColor: Colors.blueAccent.withOpacity(.1),
          highlightColor: Colors.blueAccent.withOpacity(.02),
          child: Swiper(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
              );
            },
            viewportFraction: 0.77,
            scale: 0.9,
            fade: 0,
          ),
        ),
      ),
    );
  }
}
