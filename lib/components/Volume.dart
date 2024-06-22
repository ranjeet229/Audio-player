import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongAndVolume extends StatelessWidget {
  const SongAndVolume({super.key});

  @override

  Widget build(BuildContext context) {
    SongPlayerController songPlayerController=Get.put(SongPlayerController());

    return Obx(() => Column(
      children: [
        Container(
          height: 270,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            image: const DecorationImage(image:AssetImage("assets/images/cover1.jpg"),
                fit: BoxFit.cover
            ),
            color: divColor,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.volume_down),
                  Slider(
                    value: songPlayerController.volumeLevel.value,
                    min: 0,
                    max: 1,
                    divisions: 10,
                    label: (songPlayerController.volumeLevel.value * 100).round().toString(),
                    onChanged: (double value) {
                      songPlayerController.changeVolume(value);
                    },
                  ),
                  Icon(Icons.volume_up),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
