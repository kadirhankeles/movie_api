import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoviePhoto extends StatefulWidget {
  final String path;
  const MoviePhoto({super.key, required this.path});

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
          decoration: AppConstant().ImageAndRadius("https://image.tmdb.org/t/p/original/${widget.path}", 0),
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
