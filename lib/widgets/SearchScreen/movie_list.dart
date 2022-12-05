import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/pages/movie_screen.dart';
import 'package:movie_api/providers/search_movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SearchMovieProvider value, child) {
        return value.isDataLoaded == false
            ? Container()
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //childAspectRatio: .66
                  mainAxisExtent: 33.h,
                  crossAxisSpacing: 2.h,
                ),
                itemCount: value.searchMovieData!.results!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieScreen(
                                movieId: value
                                    .searchMovieData!.results![index].id!
                                    .toInt(),
                              )));
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 27.h,
                            width: 20.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: value.isDataLoaded == false
                                ? Container()
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: FancyShimmerImage(
                                      shimmerBaseColor: Colors.blueAccent.withOpacity(.1),
                                      shimmerHighlightColor: Colors.blueAccent.withOpacity(.02),
                                      errorWidget:Image(fit: BoxFit.cover,image: NetworkImage("https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg"),),
                                        boxFit: BoxFit.cover,
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/original/${value.searchMovieData!.results![index].posterPath}"))
                            // : FancyShimmerImage(
                            //   boxFit: BoxFit.fill,
                            //     boxDecoration: BoxDecoration(
                            //         borderRadius:
                            //             BorderRadius.circular(20)),
                            //     imageUrl:
                            //         "https://image.tmdb.org/t/p/original/${value.searchMovieData!.results![index].posterPath}"),
                            /* decoration: value.searchMovieData!.results![index].posterPath == null?  AppConstant().ImageAndRadius("https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg",20):AppConstant().ImageAndRadius(
                                "https://image.tmdb.org/t/p/original/${value.searchMovieData!.results![index].posterPath}",
                                20)*/

                            ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                            child: Center(
                                child: Text(
                          "${value.searchMovieData!.results![index].title}",
                          style: AppConstant().text2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
