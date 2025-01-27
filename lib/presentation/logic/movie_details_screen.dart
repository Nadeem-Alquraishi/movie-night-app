import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/core/api/models/movie_details_model.dart';

import 'package:movies_night/presentation/utils/movie_details_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieeId;

  const MovieDetailsScreen({super.key, required this.movieeId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF242131),
        body: BlocProvider(
          create: (context) => MovieCubit()..getMovieDetails(movieeId),
          child: BlocConsumer<MovieCubit, MovieCubitState>(
            builder: (context, state) {
              if (state is MovieDetailsSuccess) {
                MovieDetailsModel moviee =
                    state.movieDetails ?? MovieDetailsModel();
                return MovieDetails(
                  movie: moviee,
                  movieId: movieeId,
                );
              }
              if (state is MovieCubitLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Error loading movie details'));
              }
            },
            listener: (BuildContext context, state) {},
          ),
        ),
      ),
    );
  }
}
