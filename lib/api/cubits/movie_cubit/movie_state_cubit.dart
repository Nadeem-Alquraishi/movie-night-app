// import 'package:movie_now/api/models/account_model.dart';
// import 'package:movie_now/api/models/movie_details_model.dart';
// import 'package:movie_now/api/models/movie_model.dart';
// import 'package:movie_now/api/models/people_model.dart';
// import 'package:movie_now/api/models/story_today.dart';
// import 'package:movie_now/features/screens/credits/model/credits_model.dart';

// sealed class MovieCubitState {}

// class MovieCubitInitial extends MovieCubitState {}

// class MovieCubitLoading extends MovieCubitState {}

// class MovieCubitSuccess extends MovieCubitState {
//   final List<MoviesModelResults?>? moviesList;
//   final List<SomeRootEntityResults?>? tvShowsList;
//   final MovieDetailsModel? movieDetails;
//   final List<CreditsModelCast?>? castList;
//   final List<CreditsModelCrew?>? crewList;
//   final List<PeopleModelResults?>? peopleList;
//   final AccountModel? accountList;

//   MovieCubitSuccess({
//     this.moviesList,
//     this.tvShowsList,
//     this.movieDetails,
//     this.castList,
//     this.crewList,
//     this.peopleList,
//     this.accountList,
//   });
// }

// class MovieCubitError extends MovieCubitState {
//   final String? message;
//   MovieCubitError({this.message});
// }



import 'package:movies_night/api/models/account_model.dart';
import 'package:movies_night/api/models/favorite_movie_model.dart';
import 'package:movies_night/api/models/movie_details_model.dart';
import 'package:movies_night/api/models/movie_model.dart';
import 'package:movies_night/api/models/people_model.dart';
import 'package:movies_night/api/models/story_today.dart';
import 'package:movies_night/api/models/top_rated_model.dart';
import 'package:movies_night/screens/credits/model/credits_model.dart';

sealed class MovieCubitState {}

class MovieCubitInitial extends MovieCubitState {}

class MovieCubitLoading extends MovieCubitState {}

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

  MovieCubitSuccess(  {
    this.tvShowList,
    this.moviesList,
    this.movieDetails,
    this.castList,
    this.crewList,
    this.peopleList,
    this.accountList,
    this.favoriteMovies,
    this.topRatedList,
  });
}

class MovieCubitError extends MovieCubitState {
  final String? message;
  MovieCubitError({this.message});
}
