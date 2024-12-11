import 'package:get_it/get_it.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/fetch_note_cubit/fech_note_cubit.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerFactory<AddNoteCubit>(() => AddNoteCubit());
  getIt.registerLazySingleton<FetchNoteCubit>(() => FetchNoteCubit());
}
