import 'package:dio/dio.dart';

import '../models/search_movie_model.dart';

Future<SearchMovieModel> getSearchMovieService(String filmAdi) async{
  var params = {
    'api_key': '4644f14aaace1a9f99a7c7f1fef1f436',
  };
   var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
   SearchMovieModel? searchMovieData;
   var url ='https://api.themoviedb.org/3/search/movie?api_key=4644f14aaace1a9f99a7c7f1fef1f436&language=en-US&query=${filmAdi}';
   var res = await Dio().get(url);
   searchMovieData = SearchMovieModel.fromJson(res.data);
   return searchMovieData;
}