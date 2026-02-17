import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/configs/constants/app_urls.dart';
import 'package:music_player/core/configs/theme/app_colors.dart';
import 'package:music_player/domain/entities/song/songs.dart';
import 'package:music_player/presentation/home/bloc/news_songs_cubit.dart';
import 'package:music_player/presentation/home/bloc/news_songs_state.dart';
import 'package:music_player/presentation/song_player/pages/song_player_page.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsSongsLoaded) {
              return _songs(state.songs);
            } else {
              return const Center(child: Text('Failed to load news songs'));
            }
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: .horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SongPlayerPage(songEntity: songs[index]);
                },
              ),
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${AppUrls.coverFireStorage}${songs.elementAt(index).artist} - ${songs.elementAt(index).title}.jpg?${AppUrls.mediaAlt}',
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: .bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey,
                        ),
                        child: Icon(Icons.play_arrow_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  songs[index].title,
                  style: TextStyle(fontWeight: .w600, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  songs[index].artist,
                  style: TextStyle(fontWeight: .w400, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: songs.length,
    );
  }
}
