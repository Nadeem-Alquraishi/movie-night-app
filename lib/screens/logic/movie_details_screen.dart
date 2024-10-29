// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_night/api/cubits/movies/cubit/movies_cubit.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   final int movieeId;

//   const MovieDetailsScreen({super.key, required this.movieeId});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0XFF242131),
//         body: BlocProvider(
//           create: (context) => MoviesCubit()..getMovies(movieeId),
//           child: BlocBuilder<MoviesCubit, MoviesState>(
//             builder: (context, state) {
//               if (state is MoviesLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is MoviesSuccess) {
//                 MovieDetailsModel moviee = state.movieDetails!;
//                 return MovieDetails(movie: moviee, movieId: movieeId);
//               } else {
//                 return const Center(child: Text('Error loading movie details'));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

