import 'package:get_it/get_it.dart';
import 'package:music_player/data/datasource/auth/auth_firebase_service.dart';
import 'package:music_player/data/datasource/song/song_firebase_service.dart';
import 'package:music_player/data/repositories/auth/auth_repo_impl.dart';
import 'package:music_player/data/repositories/song/song_repo_impl.dart';
import 'package:music_player/domain/repositories/auth/auth.dart';
import 'package:music_player/domain/repositories/song/song.dart';
import 'package:music_player/domain/usecases/auth/sign_in_usecase.dart';
import 'package:music_player/domain/usecases/auth/sign_up_usecase.dart';
import 'package:music_player/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepoImpl());

  sl.registerSingleton<SongRepository>(SongRepoImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
}
