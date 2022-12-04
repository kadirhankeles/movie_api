import 'package:flutter/cupertino.dart';
import 'package:movie_api/service/search_movie_service.dart';

import '../models/search_movie_model.dart';

class SearchMovieProvider extends ChangeNotifier{
  SearchMovieModel? searchMovieData;
  bool isDataLoaded =false;
  bool isActive=false;

  getSearchMovieData(String filmAdi) async{
    searchMovieData = await getSearchMovieService(filmAdi);
    isDataLoaded = true;
    notifyListeners();
  }
  textActive(bool choice){
    isActive =choice;
    notifyListeners();
  }
}