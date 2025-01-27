import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/presentation/screens/home/movies_list.dart';
import 'package:movies_night/core/cat_title.dart';
import 'package:movies_night/presentation/logic/top_rated_movies.dart';
import 'package:movies_night/presentation/screens/show_header/story_box.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit()..getMovies(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ListView(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: searchQuery,
                builder: (context, query, _) => TextField(
                  controller: searchController,
                  onChanged: (value) => searchQuery.value = value,
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
            ),
            StoryBox(),
            CatTitle('Movies'),
            ValueListenableBuilder(
              valueListenable: searchQuery,
              builder: (context, query, _) {
                return MoviesList(searchQuery: query);
              },
            ),
            CatTitle('Top Rated'),
            TopRatedMovies(),
          ],
        ),
      ),
    );
  }
}
