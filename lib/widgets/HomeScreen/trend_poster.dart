import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/pages/movie_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendPoster extends StatefulWidget {
  final String path;
  final double radius;
  final String movieName;
  final double star;
  final int movieId;
  const TrendPoster(
      {super.key,
      required this.path,
      required this.radius,
      required this.movieName,
      required this.star,
      required this.movieId});

  @override
  State<TrendPoster> createState() => _TrendPosterState();
}

class _TrendPosterState extends State<TrendPoster> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieScreen(movieId: widget.movieId),
            ));
          },
          child: Column(
            children: [
              Container(
                height: 45.h,
                width: 35.h,
                decoration: AppConstant()
                    .ImageAndRadius("${widget.path}", widget.radius),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                  width: 34.h,
                  child: Center(
                      child: Text(
                    "${widget.movieName}",
                    style: AppConstant().text2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )))
            ],
          ),
        ),
        Positioned(
          child: Container(
            width: 7.8.h,
            height: 3.h,
            decoration: BoxDecoration(
                color: Color(0xff212121).withOpacity(.9),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.5.h, right: 0.5.h),
              child: Row(
                children: [
                  Image.asset("assets/yildiz.png"),
                  SizedBox(
                    width: 0.4.h,
                  ),
                  Text(
                    "${widget.star}",
                    style: AppConstant().star,
                  ),
                ],
              ),
            ),
          ),
          top: 2.h,
          left: 24.h,
        )
      ],
    );
  }
}
