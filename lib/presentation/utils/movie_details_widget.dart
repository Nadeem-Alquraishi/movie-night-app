import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/core/api/models/movie_details_model.dart';

import 'package:movies_night/presentation/screens/credits/view/cast_list_of_movie.dart';
import 'package:movies_night/presentation/widgets/stars_rate_movie.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movie,
    required this.movieId,
  });

  final MovieDetailsModel movie;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          movie.posterPath != null
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                          fit: BoxFit.cover)),
                )
              : Container(height: 200, color: Colors.grey),
          SizedBox(height: MediaQuery.of(context).size.height * 0.016),
          Row(
            children: [
              Text(movie.originalTitle ?? 'N/A',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.020),
              Text(' ${movie.releaseDate..toString()}',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.030),
              BlocBuilder<MovieCubit, MovieCubitState>(
                builder: (context, state) {
                  bool isFavorite = state is MovieCubitSuccess
                      ? state.isFavorite ?? false
                      : false;
                  if (state is AddFavoriteMovieLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is AddFavoriteSuccess) {
                    return IconButton(
                      icon: Icon(
                        state.isFavorite ?? false
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: state.isFavorite ?? false
                            ? Colors.red
                            : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        if (state.isFavorite ?? false) {
                          context
                              .read<MovieCubit>()
                              .deleteFavoriteMovie(movieId);
                        } else {
                          context.read<MovieCubit>().addFavoriteMovie(movieId);
                        }
                      },
                    );
                  }

                  return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          context
                              .read<MovieCubit>()
                              .deleteFavoriteMovie(movieId);
                        } else {
                          context.read<MovieCubit>().addFavoriteMovie(movieId);
                        }
                      });
                },
              ),
            ],
          ),
          StarsRateMovie(movie: movie),
          SizedBox(height: MediaQuery.of(context).size.height * 0.016),
          Text(
              'Language: ${movie.originalLanguage == 'en' ? 'English' : 'Corean'}',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.016),
          Text(movie.overview ?? 'N/A',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          Text(
            'Casts',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          SizedBox(
            child: CastListOfMovie(movieId: movieId),
          ),
        ],
      ),
    );
  }
}
