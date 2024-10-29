import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/api/models/people_model.dart';
import 'package:movies_night/screens/utils/cast_lists.dart';

class PeopleListScreen extends StatelessWidget {
  const PeopleListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: BlocProvider(
        create: (context) => MovieCubit()..getAllCasts(),
        child: BlocBuilder<MovieCubit, MovieCubitState>(
          builder: (context, state) {
            if (state is MovieCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCubitSuccess) {
              List<PeopleModelResults?> casts = state.peopleList!;
              return CastLists(people: casts);
            } else {
              return const Center(child: Text('Error loading movie details'));
            }
          },
        ),
      ),
    );
  }
}
