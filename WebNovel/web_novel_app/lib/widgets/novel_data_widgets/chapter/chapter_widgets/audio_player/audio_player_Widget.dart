import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/audio_player/audio_control.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final String imgUrl;
  final String title;
  const AudioPlayerWidget(
      {super.key,
      required this.audioUrl,
      required this.imgUrl,
      required this.title});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position: position,
              bufferedPosition: bufferedPosition,
              duration: duration ?? Duration.zero));

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    if (widget.audioUrl != null) {
      _init();
    }
    super.initState();
  }

  Future<void> _init() async {
    final audio = AudioSource.uri(
        Uri.parse(widget.audioUrl), // Note the null assertion operator (!)
        tag: MediaItem(id: '0', title: widget.title, artist: "", artUri: Uri.parse(widget.imgUrl)));
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(audio);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 65,
      width: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(blurRadius: 2, color: black)],
          gradient: const LinearGradient(
              colors: [lightPurple, lightBlue, lightBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AudioControl(audioPlayer: _audioPlayer),
          StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SizedBox(
                height: 20,
                width: 190,
                child: ProgressBar(
                  barHeight: 4,
                  baseBarColor: black,
                  bufferedBarColor: lightPurple,
                  thumbColor: lightPurple,
                  timeLabelTextStyle: const TextStyle(
                      color: white, fontWeight: FontWeight.w600),
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  const PositionData(
      {required this.position,
      required this.bufferedPosition,
      required this.duration});
}
