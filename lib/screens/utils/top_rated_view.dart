import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_night/api/models/top_rated_model.dart';
import 'package:movies_night/screens/utils/movie_details_screen.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({
    super.key,
    required this.topRatedMovie,
  });

  final TopRatedModelResults? topRatedMovie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        margin: const EdgeInsets.all(1.0),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: topRatedMovie?.posterPath != null
              ? GestureDetector(
                  onTap: () {
                    log("Selected Movie ID: ${topRatedMovie!.id}");

                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MovieDetailsScreen(
                        movieeId: topRatedMovie!.id!,
                      );
                    }));
                  },
                  child: Stack(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${topRatedMovie?.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      children: [
                        // Calculate the number of full stars
                        for (var i = 0;
                            i < (topRatedMovie?.voteAverage ?? 0) ~/ 2;
                            i++)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20, // Adjust the size as needed
                          ),
                        // Display half star if needed
                        if ((topRatedMovie?.voteAverage ?? 0) % 2 != 0)
                          const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 20, // Adjust the size as needed
                          ),
                        // Calculate the number of empty stars
                        for (var i = 0;
                            i <
                                5 -
                                    (topRatedMovie?.voteAverage ?? 0) ~/ 2 -
                                    ((topRatedMovie?.voteAverage ?? 0) % 2 != 0
                                        ? 1
                                        : 0);
                            i++)
                          const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 20, // Adjust the size as needed
                          ),
                        // Display the numeric rating
                        Text(
                          (topRatedMovie?.voteAverage?.toString() ??
                              'No rating'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
      ),
    );
  }
}
