import 'package:dio/dio.dart';
import 'package:movie_api/models/recommended_model.dart';

Future<RecommendedMovieModel> getRecommendedService(String id) async{
  var params = {
    'api_key': '4644f14aaace1a9f99a7c7f1fef1f436',
  };
   var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
   RecommendedMovieModel? recommendedData;
   var url ='https://api.themoviedb.org/3/movie/${id}/recommendations?$query';
   var res = await Dio().get(url);
   recommendedData = RecommendedMovieModel.fromJson(res.data);
   return recommendedData;
}