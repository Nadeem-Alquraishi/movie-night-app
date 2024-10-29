// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:movie_now/screens/credits/cubit/credit_cubit.dart';
// import 'package:movie_now/screens/credits/model/credits_model.dart';
// import 'package:movie_now/screens/credits/widgets/cast_card.dart';
// import 'package:movie_now/screens/credits/widgets/crew_card.dart';

// class CrewList extends StatelessWidget {
//   final int movieId;

//   const CrewList({super.key, required this.movieId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Actors')),
//       backgroundColor: const Color(0XFF242131),
//       body: BlocProvider(
//         create: (context) => CreditCubit()..getCredits(movieId),
//         child: BlocBuilder<CreditCubit, CreditState>(
//           builder: (context, state) {
//             if (state is CreditLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is CreditSuccess) {
//               List<CreditsModelCrew?> crewList = state.crewList;
//               return ListView.builder(
//                   itemCount: crewList.length,
//                   itemBuilder: (context, index) => CrewCard(
//                       crewMember: crewList[index] ?? List.empty()[index]));
//             } else {
//               return const Center(child: Text('Error loading movie details'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
