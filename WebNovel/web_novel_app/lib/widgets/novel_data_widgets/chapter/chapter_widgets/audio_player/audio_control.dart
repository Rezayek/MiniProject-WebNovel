import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:web_novel_app/constants/colors.dart';

class AudioControl extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const AudioControl({super.key, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: 50,
            color: lightBlue,
          );
        }else if (processingState != ProcessingState.completed){
          return IconButton(
            onPressed: audioPlayer.pause,
            icon: const Icon(Icons.pause_rounded),
            iconSize: 50,
            color: lightBlue,
          );
        }
        return const Icon(Icons.play_arrow_rounded, size: 50, color: white,);
      },
    );
  }
}
