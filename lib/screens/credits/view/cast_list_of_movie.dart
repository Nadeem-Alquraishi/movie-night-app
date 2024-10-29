import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/screens/credits/model/credits_model.dart';
import 'package:movies_night/screens/credits/widgets/cast_card.dart';

class CastListOfMovie extends StatelessWidget {
  final int movieId;

  const CastListOfMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: BlocProvider(
        create: (context) => MovieCubit()..getCastsOfMovie(movieId),
        child: BlocBuilder<MovieCubit, MovieCubitState>(
          builder: (context, state) {
            if (state is MovieCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCubitSuccess) {
              List<CreditsModelCast?> castList = state.castList!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: castList.length,
                  itemBuilder: (context, index) =>
                      CastCard(cast: castList[index]));
            } else {
              return const Center(child: Text('Error loading movie details'));
            }
          },
        ),
      ),
    );
  }
}
