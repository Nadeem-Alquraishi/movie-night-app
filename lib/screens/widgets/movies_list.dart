import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/api/dependency_injection/git_it_locator.dart';

import 'package:movies_night/screens/utils/movie_list_view.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {


  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    getIt<MovieCubit>().getMovies();
  }
  @override
  initState() {
    super.initState();
    getIt<MovieCubit>().getMovies();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: BlocConsumer<MovieCubit, MovieCubitState>(
        bloc: getIt<MovieCubit>(),
        listener: (context, state) {
          if (state is MovieCubitError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load movies')),
            );
          }
        },
        builder: (context, state) {
          if (state is MovieCubitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieCubitSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.moviesList?.length,
              itemBuilder: (context, index) {
                final movie = state.moviesList?[index];
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
// import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
// import 'package:movies_night/api/dependency_injection/git_it_locator.dart';
// import 'package:movies_night/screens/utils/movie_list_view.dart';

// class MoviesList extends StatelessWidget {
//   const MoviesList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MovieCubit()..getMovies(),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.3,
//         width: MediaQuery.of(context).size.width,
//         child:
//             BlocBuilder<MovieCubit, MovieCubitState>(
//               builder: (context, state) {
//           if (state is MovieCubitLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is MovieCubitSuccess) {
//             return BlocBuilder<MovieCubit, MovieCubitState>(
              
//               builder: (context, state) {
//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: state.moviesList?.length,
//                   itemBuilder: (context, index) {
//                     final movie = state.moviesList?[index];
//                     return MovieListView(movie: movie);
//                   },
//                 );
//               },
//             );
//           } else if (state is MovieCubitError) {
//             return const Center(child: Text('Error'));
//           } else {
//             return const Center(child: Text('Error loading movie details'));
//           }
//         }),
//       ),
//     );
//   }
// }
