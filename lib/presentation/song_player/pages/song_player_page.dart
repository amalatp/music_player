import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/common/widgets/common_appbar.dart';
import 'package:music_player/core/configs/constants/app_urls.dart';
import 'package:music_player/core/configs/theme/app_colors.dart';
import 'package:music_player/domain/entities/song/songs.dart';
import 'package:music_player/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:music_player/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text("Now Playing", style: TextStyle(fontSize: 18)),
        action: IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {},
        ),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadSong(
            '${AppUrls.songFireStorage}${songEntity.artist} - ${songEntity.title}.mp3?${AppUrls.mediaAlt}',
          ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 20),
              _songDetail(),
              const SizedBox(height: 20),
              _songPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppUrls.coverFireStorage}${songEntity.artist} - ${songEntity.title}.jpg?${AppUrls.mediaAlt}',
          ),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 5),
            Text(
              songEntity.artist,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded),
        ),
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        } else if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                padding: EdgeInsets.zero,
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                min: 0,
                onChanged: (value) {},
              ),

              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context
                        .read<SongPlayerCubit>()
                        .songPosition
                        .toString()
                        .split('.')
                        .first,
                  ),
                  Text(
                    context
                        .read<SongPlayerCubit>()
                        .songDuration
                        .toString()
                        .split('.')
                        .first,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous_rounded),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<SongPlayerCubit>().playOrPauseSong(),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Icon(
                        context.read<SongPlayerCubit>().audioPlayer.playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next_rounded),
                  ),
                ],
              ),
            ],
          );
        } else if (state is SongPlayerFailure) {
          return const Text("Failed to load song");
        }
        return const SizedBox.shrink();
      },
    );
  }
}
