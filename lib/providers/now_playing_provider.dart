import 'package:flutter/material.dart';
import 'package:movie_api/models/now_playing_model.dart';
import 'package:movie_api/service/now_playing_service.dart';

class NowPlayingProvider extends ChangeNotifier{
  NowPlayingModel? nowPlayingData;
  bool isDataLoaded =false;

  GetNowPlayingData() async{
    nowPlayingData = await getNowPlayingService();
    isDataLoaded = true;
    notifyListeners();
  }
}