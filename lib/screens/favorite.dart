import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/api/dependency_injection/git_it_locator.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Favorites',
              style: TextStyle(
                color: Color.fromARGB(255, 168, 100, 246),
                fontWeight: FontWeight.bold,
              )),
        ),
        body: BlocProvider(
          create: (context) => MovieCubit()..getFavoriteMovies(),
          child: BlocBuilder<MovieCubit, MovieCubitState>(
            builder: (context, state) {
              if (state is MovieCubitLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieCubitSuccess) {
                final favoriteMovies = state.favoriteMovies;
                if (favoriteMovies == null || favoriteMovies.isEmpty) {
                  return const Center(child: Text('No favorite movies added.'));
                }
                return ListView.builder(
                  itemCount: favoriteMovies.length,
                  itemBuilder: (context, index) {
                    final movie = favoriteMovies[index];
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Colors.grey[80],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          movie?.posterPath != null
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w92${movie!.posterPath}',
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                )
                              : const SizedBox.shrink(),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.025),
                                child: Text(
                                  movie?.title ?? 'No Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(movie?.releaseDate ?? 'No Release Date'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Row(
                                children: [
                                  for (var i = 0;
                                      i < (movie?.voteAverage ?? 0) ~/ 2;
                                      i++)
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                  if ((movie?.voteAverage ?? 0) % 2 != 0)
                                    const Icon(
                                      Icons.star_half,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                  for (var i = 0;
                                      i <
                                          5 -
                                              (movie?.voteAverage ?? 0) ~/ 2 -
                                              ((movie?.voteAverage ?? 0) % 2 !=
                                                      0
                                                  ? 1
                                                  : 0);
                                      i++)
                                    const Icon(
                                      Icons.star_border,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                  Text(movie?.voteAverage.toString() ??
                                      'No Rating'),
                                ],
                              ),
                            ],
                          ),
                          Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                  left:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: GestureDetector(
                                  onTap: () {
                                    getIt<MovieCubit>()
                                        .deleteFavoriteMovie(movie!.id!);
                                    log('delete favorite movie: ${movie.title}');
                                  },
                                  child: Icon(Icons.favorite,
                                      color:
                                          isFavorite ? Colors.grey : Colors.red,
                                      size: 40)),
                            ),
                          ])
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Failed to load favorites.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
