import 'package:ai_govinds_radio/model/podcast_model.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerProvider with ChangeNotifier {
  final audioPlayer = AudioPlayer();
  Duration activeAudioDuration = Duration.zero;
  bool isPlaying = false;
  //
  PodCast? activePlayingPodCast;
  int? activePodCastEpisode;
  //
  setPlayPauseFunc(bool newValue) {
    isPlaying = newValue;
    notifyListeners();
  }

  setActivePodCast({required PodCast activePodCast, required int activeEpisodeIndex}) {
    activePlayingPodCast = activePodCast;
    activePodCastEpisode = activeEpisodeIndex;
    notifyListeners();
  }

  setAudioSource(String audioFileUrl) async {
    await audioPlayer.setSourceUrl(audioFileUrl);
  }

  playAudioPlayer(String audioFileUrl) async {
    await audioPlayer.play(UrlSource(audioFileUrl)).whenComplete(() {
      setPlayPauseFunc(true);
    });
    activeAudioDuration = await audioPlayer.getDuration() ?? Duration.zero;

    notifyListeners();
  }

  pauseAudioPlayer() async {
    await audioPlayer.pause();
    setPlayPauseFunc(false);
  }

  resumeAudioPlayer() async {
    await audioPlayer.resume();
    setPlayPauseFunc(true);
  }

  stopAudioPlayer(String audioFileUrl) async {
    await audioPlayer.stop();
    setPlayPauseFunc(false);
  }
}
