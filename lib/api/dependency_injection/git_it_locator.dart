import 'package:get_it/get_it.dart';
import 'package:movies_night/api/cubits/movie_cubit/movie_cubit.dart';


GetIt getIt = GetIt.instance;
void injection() {
  getIt.registerSingleton(MovieCubit());
}