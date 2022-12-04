import 'package:flutter/material.dart';
import 'package:movie_api/core/app_constant.dart';
import 'package:movie_api/widgets/SearchScreen/movie_list.dart';
import 'package:movie_api/widgets/SearchScreen/search_texfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? search;
  final searchCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find Movies\n           and more..",
                style: AppConstant().movieName,
              ),
              SizedBox(height: 3.h,),
              SearchTextfield(),
              MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}
