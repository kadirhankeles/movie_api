import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Recommended extends StatefulWidget {
  final String path;
  final double radius;
  const Recommended({super.key, required this.path, required this.radius});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: 22.h,
      margin: EdgeInsets.only(right: 2.h),
      child: Column(
        children: [
          Container(
            height: 15.h,
            width: 22.h,
            decoration:
                AppConstant().ImageAndRadius("${widget.path}", widget.radius),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Container(
              height: 3.h,
              width: 22.h,
              child: Center(
                  child: Text(
                "Denme",
                style: AppConstant().star,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )))
        ],
      ),
    );
  }
}
