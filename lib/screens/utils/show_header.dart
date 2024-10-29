import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_state_cubit.dart';

class ShowHeaderBox extends StatelessWidget {
  final int showId;

  const ShowHeaderBox(
    this.showId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getTvStory(), // Fetch story details
      child: BlocBuilder<MovieCubit, MovieCubitState>(
        builder: (context, state) {
          if (state is MovieCubitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieCubitSuccess) {
            final showDetails = state.tvShowList?[showId];

            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  key: Key(showId.toString()),
                  decoration: BoxDecoration(
                    color: const Color(0XFF242131),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, -10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 30, left: 20, bottom: 25),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showDetails?.originalName ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        showDetails?.overview ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Original Language: ${showDetails?.originalLanguage ?? 'N/A'}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Release Date: ${showDetails?.firstAirDate ?? 'N/A'}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Popularity: ${showDetails?.popularity?.toString() ?? 'N/A'}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Vote Count: ${showDetails?.voteCount?.toString() ?? 'N/A'}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -35,
                  right: 25,
                  child: MaterialButton(
                    onPressed: () {
                      // Define what happens when play button is pressed
                    },
                    color: const Color.fromARGB(255, 133, 77, 244),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(8.5),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
