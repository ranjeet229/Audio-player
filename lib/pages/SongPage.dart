import 'package:audio_player/Controller/Song%20data%20controller.dart';
import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:audio_player/Controller/cloudSongController.dart';
import 'package:audio_player/components/SongTile.dart';
import 'package:audio_player/components/songheader.dart';
import 'package:audio_player/components/trandingsong.dart';
import 'package:audio_player/config/colors.dart';
import 'package:audio_player/pages/playSongPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController=Get.put(SongDataController());
    SongPlayerController songPlayerController=Get.put(SongPlayerController());
    CloudSongController cloudSongController =Get.put(CloudSongController());

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const SongPageHeader(),
                const SizedBox(height: 20,),
                const TrendingSongSlider(),
                const SizedBox(height: 20,),
                Obx(() =>                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          songDataController.isDeviceSong.value=false;
                        },
                        child: Text("Cloud Song",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: songDataController.isDeviceSong.value ? lableColor : primaryColor,
                          ),

                        )),
                    InkWell(
                        onTap: (){
                          songDataController.isDeviceSong.value=true;

                        },
                        child: Text("Device Song",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: songDataController.isDeviceSong.value ? primaryColor : lableColor,
                        ),

                        )),
                  ],),),

                const SizedBox(height: 20,),
                Obx(() =>  songDataController.isDeviceSong.value ?
                Column(
                  //for device song
                  children: songDataController.localsongList.value
                      .map((e) => SongTile(
                    onPress: (){
                      songPlayerController.playLocalAudio(e);
                      songDataController.findCurrentSongIndex(e.id);
                      Get.to(PlaySongPage(

                      ));

                    },
                      songName: e.title,
                  ))
                      .toList(),)
                    : Column(
                  //for cloud song
                  children: cloudSongController.cloudSongList.value.map((e) => SongTile(
                    onPress: (){
                      songPlayerController.playCloudAudio(e);
                      songDataController.findCurrentSongIndex(e.id!);
                      Get.to(PlaySongPage());

                    },
                    songName: e.title!,
                  )).toList(),
                )
                ),
               

              ],
            ),
          ),
        ),
      ),
    );
  }
}
