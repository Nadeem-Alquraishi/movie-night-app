import 'package:flutter/material.dart';
import 'package:movies_night/presentation/screens/credits/model/credits_model.dart';

class InfoActor extends StatelessWidget {
  const InfoActor({super.key, required this.castId});
  final CreditsModelCast? castId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(castId?.name ?? 'N/A'),
      ),
      backgroundColor: const Color(0XFF242131),
      body: Column(
        children: [
          castId?.profilePath != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${castId?.profilePath}',
                    fit: BoxFit.fill,
                  ))
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/person.png'),
                  ),
                ),
          const SizedBox(height: 15),
          Text(castId?.name ?? 'N/A',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          const SizedBox(height: 10),
          Text('Department: ${castId?.knownForDepartment ?? 'Acting'}',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          const SizedBox(height: 15),
          Text('Overview: ${castId?.character ?? 'overview'}',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          const SizedBox(height: 15),
          Text('Popularity: ${castId?.popularity?.toString() ?? 'Popularity'}',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              )),
          const Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
