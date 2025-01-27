import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_night/core/api/models/movie_model.dart';

import 'package:movies_night/presentation/logic/movie_details_screen.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movie,
  });

  final MoviesModelResults? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: movie?.posterPath != null
            ? GestureDetector(
                onTap: () {
                  log("Selected Movie Name: ${movie!.originalTitle}");

                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MovieDetailsScreen(
                      movieeId: movie!.id!,
                    );
                  }));
                },
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                          ),
                          fit: BoxFit.fill,
                        )),
                  ),
                ]),
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    'No Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
      ),
    );
  }
}
