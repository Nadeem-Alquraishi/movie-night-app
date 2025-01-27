import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String image;

  const MoviePoster({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image), // Replace with your image asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
