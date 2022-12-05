import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/providers/now_playing_provider.dart';
import 'package:movie_api/widgets/HomeScreen/banner.dart';
import 'package:movie_api/widgets/HomeScreen/trend_poster.dart';
import 'package:movie_api/widgets/Shimmer/trending_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NowPlayingProvider? nowPlayindData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPlayindData = Provider.of<NowPlayingProvider>(context, listen: false);
    nowPlayindData!.GetNowPlayingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
            child: Row(
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
                SizedBox(
                  width: 1.h,
                ),
                Text(
                  "Everywhere",
                  style: AppConstant().title,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.h, right: 3.h),
            child: TopBanner(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 3.h,
              right: 3.h,
            ),
            child: Text(
              "Trending",
              style: AppConstant().title,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Container(
              height: 49.h,
              width: double.infinity,
              child: Consumer(
                builder: (context, NowPlayingProvider value, child) {
                  return value.isDataLoaded==false? TrendingShimmer(): Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return TrendPoster(
                              path:
                                  'https://image.tmdb.org/t/p/original/${value.nowPlayingData!.results![index].posterPath}',
                              radius: 25,
                              movieName:
                                  '${value.nowPlayingData!.results![index].title}',
                              star: value
                                  .nowPlayingData!.results![index].voteAverage!
                                  .toDouble(),
                              movieId: value.nowPlayingData!.results![index].id!
                                  .toInt(),
                            );
                    },
                    itemCount: 10,
                    viewportFraction: 0.77,
                    scale: 0.9,
                    fade: 0,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
