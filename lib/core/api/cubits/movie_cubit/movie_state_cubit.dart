
import 'package:movies_night/core/api/models/account_model.dart';
import 'package:movies_night/core/api/models/favorite_movie_model.dart';
import 'package:movies_night/core/api/models/movie_details_model.dart';
import 'package:movies_night/core/api/models/movie_model.dart';
import 'package:movies_night/core/api/models/people_model.dart';
import 'package:movies_night/core/api/models/story_today.dart';
import 'package:movies_night/core/api/models/top_rated_model.dart';
import 'package:movies_night/presentation/screens/credits/model/credits_model.dart';

sealed class MovieCubitState {}

class MovieCubitInitial extends MovieCubitState {}

class MovieCubitLoading extends MovieCubitState {}

class AddFavoriteMovieLoading extends MovieCubitState {}

class AddFavoriteSuccess extends MovieCubitState {
  final bool? isFavorite;

  AddFavoriteSuccess({required this.isFavorite});
}

class MovieCubitSuccess extends MovieCubitState {
    final List<StoryTodayResults?>? tvShowList;

  final List<MoviesModelResults?>? moviesList;
  final MovieDetailsModel? movieDetails;
  final List<CreditsModelCast?>? castList;
  final List<CreditsModelCrew?>? crewList;
  final List<PeopleModelResults?>? peopleList;
  final AccountModel? accountList;
  final List<FavoriteMovieModelResults?>? favoriteMovies;
  final List<TopRatedModelResults?>? topRatedList;
  final bool? isFavorite;

  MovieCubitSuccess( {
    this.tvShowList,
    this.moviesList,
    this.movieDetails,
    this.castList,
    this.crewList,
    this.peopleList,
    this.accountList,
    this.favoriteMovies,
    this.topRatedList,
    this.isFavorite,
  });
}
class MovieDetailsSuccess extends MovieCubitState {
    final List<StoryTodayResults?>? tvShowList;

  final List<MoviesModelResults?>? moviesList;
  final MovieDetailsModel? movieDetails;
  final List<CreditsModelCast?>? castList;
  final List<CreditsModelCrew?>? crewList;
  final List<PeopleModelResults?>? peopleList;
  final AccountModel? accountList;
  final List<FavoriteMovieModelResults?>? favoriteMovies;
  final List<TopRatedModelResults?>? topRatedList;
  final bool? isFavorite;

  MovieDetailsSuccess( {
    this.tvShowList,
    this.moviesList,
    this.movieDetails,
    this.castList,
    this.crewList,
    this.peopleList,
    this.accountList,
    this.favoriteMovies,
    this.topRatedList,
    this.isFavorite,
  });
}
class MovieCubitError extends MovieCubitState {
  final String? message;
  MovieCubitError({this.message});
}
