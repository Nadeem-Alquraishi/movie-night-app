

import 'package:flutter/material.dart';
import 'package:movies_night/api/models/people_model.dart';

class CastInfo extends StatelessWidget {
  const CastInfo({
    super.key,
    required this.castInfo,
  });
  final PeopleModelResults? castInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(castInfo?.originalName ?? 'N/A'),
      ),
      backgroundColor: const Color(0XFF242131),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  castInfo?.profilePath != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: Image.network(
                            'https://image.tmdb.org/t/p/w500${castInfo?.profilePath}',
                          ).image,
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/person.png'),
                          ),
                        ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    children: [
                      Text(castInfo?.name ?? 'N/A',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          )),
                      Text(castInfo?.knownForDepartment ?? 'N/A',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: castInfo?.knownFor?.length,
                itemBuilder: (context, index) {
                  final knownForItem = castInfo?.knownFor?[index];
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: knownForItem?.mediaType == 'movie'
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w500${knownForItem?.posterPath}',
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                              )
                            : Image.network(
                                'https://image.tmdb.org/t/p/w500${knownForItem?.backdropPath}',
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                              ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.080,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(221, 193, 122, 237),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                              knownForItem?.title ??
                                  knownForItem?.originalTitle ??
                                  'No name',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorLight,
                              )),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
