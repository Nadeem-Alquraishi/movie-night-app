import 'package:flutter/material.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/dependency_injection/git_it_locator.dart';

import 'package:movies_night/presentation/screens/favorite.dart';
import 'package:movies_night/presentation/screens/home.dart';
import 'package:movies_night/presentation/screens/profile.dart';

void main() {
  injection();
  runApp(const MoviesNight());
}

class MoviesNight extends StatefulWidget {
  const MoviesNight({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MoviesNight> {
  int _selectedIndex = 0;

  // Screens to switch between
  final List<Widget> _screens = <Widget>[
    Home(),
    FavoritesScreen(), // The new Favorites screen
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      getIt<MovieCubit>().getMovies();
      getIt<MovieCubit>().getFavoriteMovies();
      getIt<MovieCubit>().getAccountDetails();
      getIt<MovieCubit>().getTopRatedMovies();
      getIt<MovieCubit>().getTvStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
