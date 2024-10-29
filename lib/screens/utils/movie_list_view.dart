import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_night/api/models/movie_model.dart';
import 'package:movies_night/screens/utils/movie_details_screen.dart';

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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                      fit: BoxFit.cover,
                    ),
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
