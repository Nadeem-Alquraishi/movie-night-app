// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_night/presentation/screens/show_header/show.dart';

class StoryWidget extends StatelessWidget {
  final int storyId;
  final String posterPath;
  const StoryWidget({
    super.key,
    required this.storyId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Show(storyId, posterPath);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
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
              'https://image.tmdb.org/t/p/w500$posterPath',
            ),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
