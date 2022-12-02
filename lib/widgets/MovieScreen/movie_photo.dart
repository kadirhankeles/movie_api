import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoviePhoto extends StatefulWidget {
  const MoviePhoto({super.key});

  @override
  State<MoviePhoto> createState() => _MoviePhotoState();
}

class _MoviePhotoState extends State<MoviePhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38.h,
          width: double.infinity,
          decoration: AppConstant().ImageAndRadius("https://img2.hulu.com/user/v3/artwork/9739b68a-5d7c-44fe-8847-3e20217ca223?base_image_bucket_name=image_manager&base_image=cfca8690-25ee-437e-a74c-0f620a444ee9&size=550x825&format=jpeg", 0),
        ),
        Positioned(child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white.withOpacity(.5),),
          height: 5.h,
          width: 5.h,

          child: IconButton(
            padding: EdgeInsets.only(right: 0.3.h),
            onPressed: () {
            
          }, icon: Icon(Icons.arrow_back_ios_new_rounded, size: 21,)),
        ), left: 1.h, top: 3.h,)
      ],
    );
  }
}
