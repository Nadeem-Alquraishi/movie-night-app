import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/apikey.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/api/models/account_model.dart';
import 'package:movies_night/api/models/favorite_movie_model.dart';
import 'package:movies_night/api/models/movie_details_model.dart';
import 'package:movies_night/api/models/movie_model.dart';
import 'package:movies_night/api/models/people_model.dart';
import 'package:movies_night/api/models/story_today.dart';
import 'package:movies_night/api/models/top_rated_model.dart';
import 'package:movies_night/screens/credits/model/credits_model.dart';

class MovieCubit extends Cubit<MovieCubitState> {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String creditsUrl = 'https://api.themoviedb.org/3/movie';
  final String baseUrlFavorite =
      'https://api.themoviedb.org/3/account/21360791/favorite';
  // List<MoviesModelResults?>? _allMovies;
  // List<FavoriteMovieModelResults?> favoriteMovies = [];
  List<FavoriteMovieModelResults?>? favoriteMoviess;
  List<StoryTodayResults?>? storyToday;

  MovieCubit() : super(MovieCubitInitial());

  Dio _createDio() {
    Dio dio = Dio();
    dio.options.headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOGU1NWNjNmRjZDIzNTU2MDRjODRhNWY1MTZhNzFmYyIsIm5iZiI6MTcxOTkxMzA0MC41OTY5MjYsInN1YiI6IjY2ODNiMjQwNDhkNWM0ZmI3MGZiMTdjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mTNaSmLWDFp8BHF50TOjtFQNMB1RWHqPm26VoAxVS9k",
    };
    return dio;
  }

  Future<void> getMovies() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 3));
    Dio dio = _createDio();
    try {
      final response = await dio.get('$baseUrl/discover/movie?api_key=$apiKey');
      MoviesModel moviesModel = MoviesModel.fromJson(response.data);
      if (moviesModel.results != null) {
        emit(MovieCubitSuccess(moviesList: moviesModel.results));
      } else {
        emit(MovieCubitError(message: "No movies found."));
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response = await dio.get('$baseUrl/movie/$movieId?api_key=$apiKey');
      MovieDetailsModel movieDetails =
          MovieDetailsModel.fromJson(response.data);
      emit(MovieCubitSuccess(movieDetails: movieDetails));
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> getTvStory() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response =
          await dio.get('$baseUrl/tv/airing_today?api_key=$apiKey');
      StoryToday tvShowsModel = StoryToday.fromJson(response.data);
      if (tvShowsModel.results != null) {
        emit(MovieCubitSuccess(tvShowList: tvShowsModel.results));
      } else {
        emit(MovieCubitError(message: "No TV shows found."));
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> addFavoriteMovie(int movieId) async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = Dio();
    dio.options.headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOGU1NWNjNmRjZDIzNTU2MDRjODRhNWY1MTZhNzFmYyIsIm5iZiI6MTcyMDA5ODQ5Ni43OTg5NjEsInN1YiI6IjY2ODNiMjQwNDhkNWM0ZmI3MGZiMTdjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-V66DM2i7qNRfumw_mCofjZW9pAg0e2pXD1VVyhmR-A",
      "accept": "application/json",
      "content-type": "application/json"
    };

    try {
      final response = await dio.post(baseUrlFavorite,
          data: {"media_type": "movie", "media_id": movieId, "favorite": true});
      if (response.statusCode == 201) {
        emit(MovieCubitSuccess());
        log('add favorite ');
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> getFavoriteMovies() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response = await dio.get('$baseUrlFavorite/movies?api_key=$apiKey');
      favoriteMoviess = FavoriteMovieModel.fromJson(response.data).results;
      emit(MovieCubitSuccess(favoriteMovies: favoriteMoviess));
    } on DioException catch (e) {
      log(e.toString());

      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> deleteFavoriteMovie(int movieId) async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response = await dio.post(baseUrlFavorite, data: {
        "media_type": "movie",
        "media_id": movieId,
        "favorite": false
      });
      if (response.statusCode == 200) {
        emit(MovieCubitSuccess());
      } else {
        emit(MovieCubitLoading());
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError());
    }
  }

  Future<void> getAccountDetails() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response = await dio.get('$baseUrl/account?api_key=$apiKey');
      AccountModel accountModel = AccountModel.fromJson(response.data);
      emit(MovieCubitSuccess(accountList: accountModel));
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<void> getCastsOfMovie(int movieId) async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response =
          await dio.get('$creditsUrl/$movieId/credits?api_key=$apiKey');
      CreditsModel castsModel = CreditsModel.fromJson(response.data);
      if (castsModel.cast != null) {
        emit(MovieCubitSuccess(
            castList: castsModel.cast, crewList: castsModel.crew));
      } else {
        emit(MovieCubitError(message: "No credits found."));
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> getAllCasts() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 1));
    Dio dio = _createDio();
    try {
      final response = await dio.get('$baseUrl/person/popular?api_key=$apiKey');
      PeopleModel peopleModel = PeopleModel.fromJson(response.data);
      if (peopleModel.results != null) {
        emit(MovieCubitSuccess(peopleList: peopleModel.results));
      } else {
        emit(MovieCubitError(message: "No people found."));
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(MovieCubitLoading());
    await Future.delayed(const Duration(seconds: 3));
    Dio dio = _createDio();
    try {
      final response =
          await dio.get('$baseUrl/movie/top_rated?api_key=$apiKey');
      TopRatedModel topRatedModel = TopRatedModel.fromJson(response.data);
      if (topRatedModel.results != null) {
        emit(MovieCubitSuccess(topRatedList: topRatedModel.results));
      } else {
        emit(MovieCubitError(message: "No movies found."));
      }
    } on DioException catch (e) {
      log(e.toString());
      emit(MovieCubitError(message: e.message));
    }
  }
}