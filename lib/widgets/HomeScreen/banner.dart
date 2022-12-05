import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
          child: Container(
            height: 24.h,
            width: double.infinity,
            child: ClipRRect(borderRadius:BorderRadius.circular(25), child: FancyShimmerImage(imageUrl: "https://images.alphacoders.com/246/246473.jpg", boxFit: BoxFit.cover, )),
            decoration: AppConstant().ImageAndRadius(
                "https://images.alphacoders.com/246/246473.jpg", 25),
          ),
        ),
        Positioned(
          child: Container(
            height: 8.h,
            width: 27.h,
            decoration: BoxDecoration(
                color: Color(0xff212121).withOpacity(0.6),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(width: 1.h,),
                Image.asset("assets/Play (1).png"),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue Watching", style: AppConstant().text1,),
                    SizedBox(height: 1.h,),
                    Text("Ready Player one", style: AppConstant().text2,)
                  ],
                )
              ],
            ),
          ),
          top: 19.h,
          left: 3.h,
        )
      ],
    );
  }
}
