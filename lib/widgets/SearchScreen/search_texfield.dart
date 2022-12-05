import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/providers/search_movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/app_constant.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: double.infinity,
      child: TextField(

        style: TextStyle(fontSize: 18, height: 0.15.h, color: Colors.white),
        decoration: InputDecoration(
          isDense: false,
          filled: true,
          
          contentPadding: EdgeInsets.only(bottom: 0, top: 0, left: 0 , right: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: 'Movie...',
          fillColor: Color(0xff211F30),
          labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 15),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        onChanged: (value) {
          if(value.length > 1){
            Provider.of<SearchMovieProvider>(context, listen: false).textActive(true);
            Provider.of<SearchMovieProvider>(context, listen: false).getSearchMovieData(value);
            print("Değer: "+ value);
          }else{
            Provider.of<SearchMovieProvider>(context, listen: false).textActive(false);
          }
        },
    ),
    );
  }
}