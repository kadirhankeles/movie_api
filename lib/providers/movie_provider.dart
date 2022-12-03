import 'package:flutter/material.dart';
import 'package:movie_api/service/movie_service.dart';

import '../models/movie_model.dart';
import '../service/now_playing_service.dart';


class MovieProvider extends ChangeNotifier{
  MovieModel? movieData;
  bool isDataLoaded =false;

  GetMovieData(String id) async{
    movieData = await getMovieService(id);
    isDataLoaded = true;
    notifyListeners();
  }
}