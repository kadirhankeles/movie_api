import 'package:flutter/cupertino.dart';
import 'package:movie_api/models/recommended_model.dart';
import 'package:movie_api/service/recommended_service.dart';

class RecommendedProvider extends ChangeNotifier{
  RecommendedMovieModel? recommendedData;
  bool isDataLoaded =false;

  getRecommendedData(String id) async{
    recommendedData = await getRecommendedService(id);
    isDataLoaded = true;
    notifyListeners();
  }
}