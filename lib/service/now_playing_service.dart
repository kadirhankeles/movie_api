import 'package:dio/dio.dart';
import 'package:movie_api/models/now_playing_model.dart';

Future<NowPlayingModel> getNowPlayingService() async{
  var params = {
    'api_key': '4644f14aaace1a9f99a7c7f1fef1f436',
  };
   var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
   NowPlayingModel? nowPlayingData;
   var url ='https://api.themoviedb.org/3/movie/now_playing?$query';
   var res = await Dio().get(url);
   nowPlayingData = NowPlayingModel.fromJson(res.data);
   return nowPlayingData;
}