
import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController=Get.put(SongPlayerController());
    return Column(
      children: [
      Row(
        children: [
          Icon(Icons.play_arrow_outlined),
          SizedBox(width: 10,),
          Text("210 Plays",style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Obx(() => Text(
                "${songPlayerController.songTitle.value}",
                maxLines: 1,
                style: Theme.of(context).textTheme.labelLarge
            ),),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/download.svg",
              width: 20,),

            ],)
        ],
      ),
      SizedBox(height: 5,),
      Obx(() =>       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "${songPlayerController.songArtist.value}",
              style: Theme.of(context).textTheme.bodySmall),



        ],
      ),),
    ],);
  }
}
