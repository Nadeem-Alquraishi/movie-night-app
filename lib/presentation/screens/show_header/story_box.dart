import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';


class StoryBox extends StatelessWidget {
  const StoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getTvStory(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<MovieCubit, MovieCubitState>(
          builder: (context, state) {
            if (state is MovieCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCubitSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.tvShowList?.length,
                  itemBuilder: (context, index) {
                    final movie = state.tvShowList![index];
                    return GestureDetector(
                      onTap: () {
                        log(movie!.id.toString());
                        log(movie.name.toString());
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         Show(movie.id!, movie.posterPath!),
                        //   ),
                        // );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.10,
                            margin: const EdgeInsets.only(left: 15.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          //   width: 75,
                          //   child: Text(
                          //     movie?.name.toString() ?? 'No Name',
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
                child: Text('Press the button to fetch movies'));
          },
        ),
      ),
    );
  }
}
