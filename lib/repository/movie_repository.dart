import 'package:mvvmloginsignup/data/network/base_api_services.dart';
import 'package:mvvmloginsignup/data/network/network_api_services.dart';
import 'package:mvvmloginsignup/models/movie_model.dart';
import 'package:mvvmloginsignup/res/app_url.dart';

class MovieRepository {
  BaseApiServices apiServices=NetworkApiServices();

  Future<MovieModel> getMovieList() async{
    try{
      dynamic response=await apiServices.getGetApiResponse(AppUrl.movieListShowEndPoint);
      return response=MovieModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}