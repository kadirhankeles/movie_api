import 'package:dio/dio.dart';
import 'package:movie_api/models/movie_model.dart';
import 'package:movie_api/models/now_playing_model.dart';

Future<MovieModel> getMovieService(String id) async{
  var params = {
    'api_key': '4644f14aaace1a9f99a7c7f1fef1f436',
  };
   var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
   MovieModel? movieData;
   var url ='https://api.themoviedb.org/3/movie/$id?$query';
   var res = await Dio().get(url);
   movieData = MovieModel.fromJson(res.data);
   return movieData;
}