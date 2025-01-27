import 'package:flutter/material.dart';
import 'package:movies_night/presentation/screens/credits/model/credits_model.dart';

class CrewCard extends StatelessWidget {
  const CrewCard({super.key, required this.crewMember});

  final CreditsModelCrew? crewMember;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0XFF393640),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: crewMember?.profilePath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w200${crewMember?.profilePath}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Colors.white,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crewMember?.name ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      crewMember?.job ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
