import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendPoster extends StatefulWidget {
  const TrendPoster({super.key});

  @override
  State<TrendPoster> createState() => _TrendPosterState();
}

class _TrendPosterState extends State<TrendPoster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 33.h,
      decoration: AppConstant().ImageAndRadius("https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg", 25),
    );
  }
}