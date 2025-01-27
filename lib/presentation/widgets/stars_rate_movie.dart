import 'package:flutter/material.dart';
import 'package:movies_night/core/api/models/movie_details_model.dart';

// ignore: must_be_immutable
class StarsRateMovie extends StatelessWidget {
  const StarsRateMovie({
    super.key,
    this.movie,
  });

  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < (movie?.voteAverage ?? 0) ~/ 2; i++)
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 25,
          ),
        if ((movie?.voteAverage ?? 0) % 2 != 0)
          const Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 25,
          ),
        for (var i = 0;
            i <
                5 -
                    (movie?.voteAverage ?? 0) ~/ 2 -
                    ((movie?.voteAverage ?? 0) % 2 != 0 ? 1 : 0);
            i++)
          const Icon(
            Icons.star_border,
            color: Colors.amber,
            size: 25,
          ),
      ],
    );
  }
}
