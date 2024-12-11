import 'package:get_it/get_it.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/cubit/add_note_cubit.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerFactory<AddNoteCubit>(() => AddNoteCubit());
}
