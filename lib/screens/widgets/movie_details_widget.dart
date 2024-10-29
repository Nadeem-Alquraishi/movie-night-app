// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/dependency_injection/git_it_locator.dart';
import 'package:movies_night/api/models/movie_details_model.dart';
import 'package:movies_night/screens/credits/view/cast_list_of_movie.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  MovieDetails({
    super.key,
    required this.movie,
    required this.movieId,
  });

  final MovieDetailsModel movie;
  final int movieId;
  bool isFavorite = false;

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
          const SizedBox(height: 16),
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
              GestureDetector(
                  onTap: () {
                    getIt<MovieCubit>().addFavoriteMovie(movieId);
                    log('add favorite : ${movie.originalTitle}');
                  },
                  child: Icon(Icons.favorite,
                      color: isFavorite ? Colors.grey : Colors.red, size: 25)),
            ],
          ),
          Row(
            children: [
              for (var i = 0; i < (movie.voteAverage ?? 0) ~/ 2; i++)
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 25,
                ),
              if ((movie.voteAverage ?? 0) % 2 != 0)
                const Icon(
                  Icons.star_half,
                  color: Colors.amber,
                  size: 25,
                ),
              for (var i = 0;
                  i <
                      5 -
                          (movie.voteAverage ?? 0) ~/ 2 -
                          ((movie.voteAverage ?? 0) % 2 != 0 ? 1 : 0);
                  i++)
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 25,
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
              'Language: ${movie.originalLanguage == 'en' ? 'English' : 'Corean'}',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          const SizedBox(height: 8),
          Text(movie.overview ?? 'N/A',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          // const SizedBox(height: 16),
          // Text('Popularity: ${movie.popularity?.toString() ?? 'N/A'}',
          //     style: TextStyle(
          //       fontSize: 24.0,
          //       fontWeight: FontWeight.bold,
          //       color: Theme.of(context).primaryColorLight,
          //     )),
          // const SizedBox(height: 8),
          // Text('Vote Count: ${movie.voteCount?.toString() ?? 'N/A'}',
          //     style: TextStyle(
          //       fontSize: 24.0,
          //       fontWeight: FontWeight.bold,
          //       color: Theme.of(context).primaryColorLight,
          //     )),
          // const CatTitle('Casts'),
          Text(
            'Cast',
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
