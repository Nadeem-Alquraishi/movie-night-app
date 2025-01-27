
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/presentation/screens/home/top_rated_view.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getTopRatedMovies(),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<MovieCubit, MovieCubitState>(
              builder: (context, state) {
            if (state is MovieCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCubitSuccess) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topRatedList?.length,
                itemBuilder: (context, index) {
                  final topRatedMovie = state.topRatedList?[index];
                  return TopRatedView(topRatedMovie: topRatedMovie);
                },
              );
            } else if (state is MovieCubitError) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(child: Text('Error loading movie details'));
            }
          }),
          ),
    );
  }
}
