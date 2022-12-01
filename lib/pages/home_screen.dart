import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/widgets/HomeScreen/banner.dart';
import 'package:movie_api/widgets/HomeScreen/trend_poster.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Padding(
        padding:  EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                children: [
                  GradientText(
                    "Stream",
                  gradientType: GradientType.linear,
                  style: AppConstant().title,
                  colors: [
                    AppConstant().gradientStart,
                    AppConstant().gradientFinal
                  ],
                  ),
                  SizedBox(width: 1.h,),
                  Text("Everywhere", style: AppConstant().title,),
                ],
              ),
            TopBanner(),
            Text("Trending", style: AppConstant().title,),
            SizedBox(height: 3.h,),
            TrendPoster(),
            
          ],
        ),
      ),
    );
  }
}