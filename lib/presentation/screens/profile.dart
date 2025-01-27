import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_night/core/api/cubits/movie_cubit/movie_state_cubit.dart';
import 'package:movies_night/core/api/models/account_model.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (context) => MovieCubit()..getAccountDetails(),
        child: BlocBuilder<MovieCubit, MovieCubitState>(
          builder: (context, state) {
            if (state is MovieCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCubitSuccess) {
              final account = state.accountList;
              return account != null
                  ? _buildProfileContent(account)
                  : const Center(child: Text('No account details found.'));
            } else if (state is MovieCubitError) {
              return Center(
                  child: Text(state.message ?? 'Error fetching data.'));
            } else {
              return const Center(child: Text('Something went wrong.'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(AccountModel account) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: account.avatar?.tmdb?.avatarPath != null
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w500${account.avatar!.tmdb!.avatarPath}')
                    : null,
                child: account.username != null
                    ? Text(account.username!.substring(0, 1).toUpperCase())
                    : null,
              ),
              const SizedBox(height: 10),
              Text(
                account.username ?? 'Username',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ProfileDetailRow(
                  icon: Icons.person, label: account.username ?? 'Username'),
              ProfileDetailRow(
                  icon: Icons.language, label: account.iso_639_1 ?? 'Language'),
              ProfileDetailRow(
                  icon: Icons.flag, label: account.iso_3166_1 ?? 'Country'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text('Edit profile',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPassword;

  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 20),
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 18)),
          ),
          if (isPassword) const Icon(Icons.visibility_off, color: Colors.grey),
        ],
      ),
    );
  }
}
