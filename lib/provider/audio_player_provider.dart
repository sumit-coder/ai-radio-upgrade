import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerProvider with ChangeNotifier {
  final audioPlayer = AudioPlayer();

  setAudioSource(String audioFileUrl) async {
    await audioPlayer.setSourceUrl(audioFileUrl);
  }

  playAudioPlayer(String audioFileUrl) async {
    await audioPlayer.play(UrlSource(audioFileUrl));
  }

  pauseAudioPlayer() async {
    await audioPlayer.pause();
  }

  stopAudioPlayer(String audioFileUrl) async {
    await audioPlayer.stop();
  }

  getTimeLine() {
    PlayerState.paused;
  }
}
