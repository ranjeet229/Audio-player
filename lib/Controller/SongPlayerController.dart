
import 'dart:ffi';

import 'package:audio_player/Model/MySongModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController{

  final player=AudioPlayer();

  RxBool isPlaying=false.obs;
  RxString CurrentTime="0".obs;
  RxString TotalTime="0".obs;
  RxDouble sliderValue=0.0.obs;
  RxDouble sliderMaxValue=0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isLoop =false.obs;
  RxBool isSuffeled =false.obs;
  RxDouble volumeLevel=0.2.obs;

  void playLocalAudio(SongModel song) async{
    songTitle.value=song.title;
    songArtist.value=song.artist!;

    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data),
      )
    );
    player.play();
    updatePosition();
    isPlaying.value=true;
  }

  void playCloudAudio(MySongModel song) async{
    songTitle.value=song.title!;
    songArtist.value=song.artist!;

    await player.setAudioSource(
        AudioSource.uri(
          Uri.parse(song.data!),
        )
    );
    player.play();
    updatePosition();
    isPlaying.value=true;
  }


  void changeVolume(double volume){
    volumeLevel.value=volume;
    player.setVolume(volumeLevel.value);
  }

  void setLoopSong() async{
    if(isLoop.value){
      await player.setLoopMode(LoopMode.off);
    }else{
      await player.setLoopMode(LoopMode.one);
    }
    isLoop.value= !isLoop.value;
  }
  void RandomSong()async{
    if(isSuffeled.value){
      await player.setShuffleModeEnabled(false);
    }else{
      await player.setShuffleModeEnabled(true);
    }

    isSuffeled.value=!isSuffeled.value;
  }

  void resumePlaying() async{
    isPlaying.value=true;
    await player.play();

  }

  void pausePlaying() async{
    isPlaying.value=false;
    await player.pause();

  }

  void  changeSongSlider(Duration position){

    player.seek(position);
  }
  void updatePosition() async{
    try{
      player.durationStream.listen((d) {
        TotalTime.value=d.toString().split(".")[0];
        sliderMaxValue.value=d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p) {
        CurrentTime.value=p.toString().split(".")[0];
        sliderValue.value=p.inSeconds.toDouble();
      });
    }catch(e){
      print(e);
    }
  }

}
