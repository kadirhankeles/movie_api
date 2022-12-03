import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/models/movie_model.dart';
import 'package:movie_api/providers/movie_provider.dart';
import 'package:movie_api/providers/recommended_provider.dart';
import 'package:movie_api/widgets/MovieScreen/movie_photo.dart';
import 'package:movie_api/widgets/MovieScreen/recommended.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MovieScreen extends StatefulWidget {
  final int movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieProvider? movieData;
  RecommendedProvider? recommendedData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieData = Provider.of<MovieProvider>(context, listen: false);
    movieData!.GetMovieData(widget.movieId.toString());

    recommendedData = Provider.of<RecommendedProvider>(context, listen: false);
    recommendedData!.getRecommendedData(widget.movieId.toString());

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, MovieProvider value, child) {
                return value.isDataLoaded == false
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MoviePhoto(
                              path: value.movieData!.backdropPath!.toString()),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h, right: 3.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${value.movieData!.originalTitle}",
                                  style: AppConstant().movieName,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_sharp,
                                      color: Color(0xffBBBBBB),
                                      size: 21,
                                    ),
                                    SizedBox(
                                      width: 0.6.h,
                                    ),
                                    Text(
                                      "${TimeCalculator(value.movieData!.runtime)} m",
                                      style: AppConstant().movieDetail,
                                    ),
                                    SizedBox(
                                      width: 2.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffBBBBBB),
                                      size: 21,
                                    ),
                                    SizedBox(
                                      width: 0.6.h,
                                    ),
                                    Text(
                                      "${value.movieData!.voteAverage!.toStringAsFixed(2)}",
                                      style: AppConstant().movieDetail,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Divider(
                                  height: 1.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Release date",
                                          style: AppConstant().text2,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "${value.movieData!.releaseDate}",
                                          style: AppConstant().movieDetail,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Genre",
                                          style: AppConstant().text2,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          height: 3.h,
                                          width: 17.h,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                value.movieData!.genres!.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: 3.h,
                                                width: 7.h,
                                                margin:
                                                    EdgeInsets.only(right: 1.h),
                                                decoration:
                                                    AppConstant().turDecoration,
                                                child: Center(
                                                  child: Text(
                                                    "${value.movieData!.genres![index].name}",
                                                    style:
                                                        AppConstant().movieDetail,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Divider(
                                  height: 1.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  "Synopsis",
                                  style: AppConstant().text2,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 7.h,
                                  width: double.infinity,
                                  child: Text(
                                    "${value.movieData!.overview}",
                                    style: AppConstant().movieDetail,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Text(
                "Recommended Movie",
                style: AppConstant().text2,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer(
              builder: (context, RecommendedProvider value, child) {
                return Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Container(
                    height: 19.h,
                    width: double.infinity,
                    child: value.isDataLoaded==false? CircularProgressIndicator(): ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Recommended(
                          path:
                              '${value.recommendedData!.results![index].posterPath}',
                          radius: 20, movieName: '${value.recommendedData!.results![index].originalTitle}', movieId: value.recommendedData!.results![index].id!.toInt(),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

String TimeCalculator(int? runtime) {
  String sure = "";
  sure = (runtime! * (1 / 60)).toStringAsFixed(2);
  sure = sure.replaceAll('.', 'h ');
  return sure;
}
