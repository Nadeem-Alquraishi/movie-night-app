// import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:movie_now/features/screens/user_profile/user_profile.dart';

// class NaviBar extends StatelessWidget {
//   const NaviBar({
//     super.key,
//     required this.itsHome,
//   });
//   final bool itsHome;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: MediaQuery.sizeOf(context).width,
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 52, 47, 73),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black,
//             blurRadius: 10,
//             spreadRadius: 1,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: itsHome
//                   ? const Color.fromARGB(255, 181, 170, 231)
//                   : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: IconButton(
//                 icon: const Icon(
//                   FontAwesomeIcons.homeUser,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 onPressed: () {
//                   itsHome == false ? Navigator.pop(context) : null;
//                 },
//               ),
//             ),
//           ),
//           Builder(builder: (context) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: itsHome == false
//                     ? const Color.fromARGB(255, 181, 170, 231)
//                     : Colors.transparent,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.favorite,
//                     color: Color.fromARGB(255, 255, 255, 255),
//                   ),
//                   onPressed: () async {
//                     // itsHome == true
//                     //     ? await context
//                     //         .read<ChatServiceCubit>()
//                     //         .getAllPatientChatBoxes(
//                     //           doctorId:
//                     //               LocalUserModel.getUserId().toString(),
//                     //         )
//                     //     : null;
//                   },
//                 ),
//               ),
//             );
//           }),
//           Container(
//             decoration: BoxDecoration(
//               color: itsHome == false
//                   ? const Color.fromARGB(255, 181, 170, 231)
//                   : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.account_circle,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 onPressed: () async {
//                   itsHome == true
//                       ? Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const ProfileScreen(),
//                           ),
//                         )
//                       : null;
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_night/screens/favorite.dart';
import 'package:movies_night/screens/profile.dart';

class NaviBar extends StatelessWidget {
  const NaviBar({
    super.key,
    required this.itsHome,
  });
  final bool itsHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 52, 47, 73),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: itsHome
                  ? const Color.fromARGB(255, 181, 170, 231)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.homeUser,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  itsHome == false ? Navigator.pop(context) : null;
                },
              ),
            ),
          ),
          Builder(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: itsHome == false
                    ? const Color.fromARGB(255, 181, 170, 231)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FavoritesScreen(),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
          Container(
            decoration: BoxDecoration(
              color: itsHome == false
                  ? const Color.fromARGB(255, 181, 170, 231)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () async {
                  itsHome == true
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        )
                      : null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
