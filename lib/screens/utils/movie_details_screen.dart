import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/api/models/movie_details_model.dart';
import 'package:movies_night/screens/widgets/movie_details_widget.dart';


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
          child: BlocBuilder<MovieCubit, MovieCubitState>(
            builder: (context, state) {
              if (state is MovieCubitLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieCubitSuccess) {
                MovieDetailsModel moviee = state.movieDetails!;
                return MovieDetails(movie: moviee, movieId: movieeId);
              } else {
                return const Center(child: Text('Error loading movie details'));
              }
            },
          ),
        ),
      ),
    );
  }
}

