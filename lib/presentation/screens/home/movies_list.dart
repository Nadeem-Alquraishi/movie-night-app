import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/presentation/utils/movie_list_view.dart';

class MoviesList extends StatelessWidget {
  final String searchQuery;

  const MoviesList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<MovieCubit, MovieCubitState>(
        builder: (context, state) {
          if (state is MovieCubitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieCubitSuccess) {
            final filteredMovies = state.moviesList?.where((movie) {
              final title = movie?.originalTitle?.toLowerCase() ?? '';
              return title.contains(searchQuery.toLowerCase());
            }).toList();

            if (filteredMovies == null || filteredMovies.isEmpty) {
              return const Center(
                child: Text('No movies found.'),
              );
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return MovieListView(movie: movie);
              },
            );
          } else if (state is MovieCubitError) {
            return const Center(child: Text('Failed to load movies.'));
          }
          return const Center(child: Text('Press the button to fetch movies'));
        },
      ),
    );
  }
}
