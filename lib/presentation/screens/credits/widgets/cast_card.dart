// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_night/presentation/screens/credits/model/credits_model.dart';
import 'package:movies_night/presentation/screens/credits/widgets/info_actor.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.cast,
  });
  final CreditsModelCast? cast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoActor(
                      castId: cast,
                    )));
        log("Selected cast ID: ${cast?.id}");
      },
      child: Column(
        children: [
          cast?.profilePath != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: Image.network(
                            'https://image.tmdb.org/t/p/w500${cast?.profilePath}')
                        .image,
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/person.png'),
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(cast?.name ?? 'N/A',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
        ],
      ),
    );
  }
}



// // crew_card.dart
