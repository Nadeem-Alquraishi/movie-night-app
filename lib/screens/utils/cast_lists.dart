

import 'package:flutter/material.dart';
import 'package:movies_night/api/models/people_model.dart';
import 'package:movies_night/screens/credits/widgets/cast_info.dart';

class CastLists extends StatelessWidget {
  const CastLists({
    super.key,
    required this.people,
  });

  final List<PeopleModelResults?> people;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CastInfo(castInfo: person),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: [
                person?.profilePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${person?.profilePath}',
                        ),
                      )
                    : const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          image: AssetImage('assets/images/user.png'),
                        ),
                      ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.4,
                    // height: MediaQuery.of(context).size.height * 0.040,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(221, 193, 122, 237),
                    ),
                    alignment: Alignment.center,
                    child: Text('${person?.name}'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
