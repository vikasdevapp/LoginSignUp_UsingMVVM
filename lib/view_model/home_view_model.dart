import 'package:flutter/cupertino.dart';
import 'package:mvvmloginsignup/data/response/api_response.dart';
import 'package:mvvmloginsignup/models/movie_model.dart';
import 'package:mvvmloginsignup/repository/movie_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _movieRep=MovieRepository();

  ApiResponse<MovieModel> movieList=ApiResponse.loading();

  setMovieList(ApiResponse<MovieModel> response){
    movieList=response;
    notifyListeners();
  }

  Future getMovieList()async{
    setMovieList(ApiResponse.loading());
          _movieRep.getMovieList().then((value){
         setMovieList(ApiResponse.completed(value));
      }).onError((error,stackTrace){
        setMovieList(ApiResponse.error(error.toString()));
      });
  }

}