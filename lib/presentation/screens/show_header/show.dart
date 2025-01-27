import 'package:flutter/material.dart';

import 'package:movies_night/presentation/screens/show_header/show_header.dart';

class Show extends StatelessWidget {
  // const Show({Key key}) : super(key: key);
  final int showId;
  final String posterPath;
  const Show(this.showId, this.posterPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/original$posterPath'),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 20),
              child: DraggableScrollableSheet(builder: (context, controller) {
                return ListView(
                  controller: controller,
                  children:[ 
                    
                    ShowHeaderBox(
                    showId,
                  ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
