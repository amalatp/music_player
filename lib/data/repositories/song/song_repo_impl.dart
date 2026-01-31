import 'package:dartz/dartz.dart';
import 'package:music_player/data/datasource/song/song_firebase_service.dart';
import 'package:music_player/domain/repositories/song/song.dart';
import 'package:music_player/service_locator.dart';

class SongRepoImpl implements SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
