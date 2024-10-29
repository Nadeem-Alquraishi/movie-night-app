import 'package:flutter/material.dart';
import 'package:movies_night/core/cat_title.dart';
import 'package:movies_night/screens/widgets/movies_list.dart';
import 'package:movies_night/screens/widgets/story_box.dart';
import 'package:movies_night/screens/logic/top_rated_movies.dart';

// ignore: must_be_immutable
class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  TextEditingController searchControllers = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListView(
        children: [
          //Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          StoryBox(),

          CatTitle('Movies'),
          MoviesList(),
          CatTitle('Top Rated'),
          TopRatedMovies(),
          // PeopleListScreen()
        ],
      ),
    );
  }
}
