import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/pages/movie_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Recommended extends StatefulWidget {
  final String path;
  final double radius;
  final String movieName;
  final int movieId;
  const Recommended({super.key, required this.path, required this.radius, required this.movieName, required this.movieId});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieScreen(movieId: widget.movieId),));
      },
      child: Container(
        height: 19.h,
        width: 22.h,
        margin: EdgeInsets.only(right: 2.h),
        child: Column(
          children: [
            Container(
              height: 15.h,
              width: 22.h,
              decoration:
                  AppConstant().ImageAndRadius("https://image.tmdb.org/t/p/original/${widget.path}", widget.radius),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
                height: 3.h,
                width: 22.h,
                child: Center(
                    child: Text(
                  "${widget.movieName}",
                  style: AppConstant().star,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )))
          ],
        ),
      ),
    );
  }
}
