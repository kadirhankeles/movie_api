import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/widgets/MovieScreen/movie_photo.dart';
import 'package:movie_api/widgets/MovieScreen/recommended.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MovieScreen extends StatefulWidget {
  final int movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePhoto(),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.h, right: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Film adı",
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
                      "Zaman",
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
                      "Puan",
                      style: AppConstant().movieDetail,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Divider(
                  height: 1.h,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Release date",
                          style: AppConstant().text2,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Tarih",
                          style: AppConstant().movieDetail,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genre",
                          style: AppConstant().text2,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Tür",
                          style: AppConstant().movieDetail,
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
                  height: 1.5.h,
                ),
                Container(
                  height: 7.h,
                  width: double.infinity,
                  child: Text(
                    "Lorem jfdsjfdksj fhdsh ds jhdsf dsfd sjhfd sjhfds dsjahd sahdhk sad kgsagkd agshkd gasghkd gkshdhg ksakghd ghkasgkh gsd kghasghdkgasd gkhsakghd gkasgkdh askgd gasgd hagskdgh asgkhgk",
                    style: AppConstant().movieDetail,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Recommended Movie",
                  style: AppConstant().text2,
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Container(
              height: 19.h,
              width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Recommended(
                      path:
                          'https://www.cevirce.com/tr/ceviri-resim/ingilizce-turkce-ceviri.jpg',
                      radius: 20,
                    );
                  },
                ),
             
            ),
          )
        ],
      ),
    );
  }
}
