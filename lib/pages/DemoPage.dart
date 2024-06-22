import 'package:audio_player/Controller/cloudSongController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController=Get.put(CloudSongController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Call Database'),
          onPressed: (){
            cloudSongController.getcloudSong();

          },
        ),
      ),
    );
  }
}
