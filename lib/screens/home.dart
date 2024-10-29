// import 'package:flutter/material.dart';
// import 'package:movies_night/screens/widgets/category_button.dart';
// import 'package:movies_night/screens/widgets/category_chip.dart';
// import 'package:movies_night/screens/widgets/pooster.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome Moka'),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundImage: AssetImage(
//                   'assets/imagetest.png'), // Replace with your profile image asset
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.white24,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               // const SizedBox(height: 20),

//               // Categories
//               // const Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     CategoryButton(label: 'All', selected: true),
//               //     CategoryButton(label: 'TV shows'),
//               //     CategoryButton(label: 'Movies'),
//               //     CategoryButton(label: 'Cartoon'),
//               //   ],
//               // ),
//               // const SizedBox(height: 20),

//               // Featured Image
//               // Container(
//               //   height: 200,
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(15),
//               //     image: const DecorationImage(
//               //       image: AssetImage(
//               //           'assets/imagetest.png'), // Replace with your image asset
//               //       fit: BoxFit.cover,
//               //     ),
//               //   ),
//               //   child: Center(
//               //     child: IconButton(
//               //       icon: const Icon(Icons.play_circle_fill,
//               //           size: 60, color: Colors.white),
//               //       onPressed: () {},
//               //     ),
//               //   ),
//               // ),
//               // const SizedBox(height: 20),

//               // Categories List
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Categories', style: TextStyle(fontSize: 18)),
//                   TextButton(onPressed: () {}, child: const Text('See all')),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     CategoryChip(label: 'Netflix'),
//                     CategoryChip(label: 'Action'),
//                     CategoryChip(label: 'Adventure'),
//                     CategoryChip(label: 'Fantasy'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Top Picks for You
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Top Picks for you',
//                       style: TextStyle(fontSize: 18)),
//                   TextButton(onPressed: () {}, child: const Text('See all')),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//               const SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     MoviePoster(image: 'assets/imagetest.png'),
//                     MoviePoster(image: 'assets/imagetest.png'),
//                     MoviePoster(image: 'assets/imagetest.png'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//               // Popular Shows
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Popular shows', style: TextStyle(fontSize: 18)),
//                   TextButton(onPressed: () {}, child: const Text('See all')),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:movie_now/screens/cast_list.dart';

// import 'package:movie_now/screens/utils/cat_title.dart';

// import 'package:movie_now/screens/utils/movies_list.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 181, 170, 231),
//       // backgroundColor: const Color(0XFF242131),
//       appBar: AppBar(
//         title: const Text('Movie Now'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(bottom: 10.0),
//         child: ListView(children: const [
//           // CatTitle('Cast List'),

//           CatTitle('Movie List'),
//             MoviesList()
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movies_night/screens/widgets/home_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 181, 170, 231),
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 44, 34, 86),
        centerTitle: true,
        title: const Text('Movie Night',
            style: TextStyle(
              color: Color.fromARGB(255, 168, 100, 246),
              fontWeight: FontWeight.bold,
            )),
      ),
      body: HomeWidget(),
    );
  }
}
