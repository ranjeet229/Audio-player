import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({Key? key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: divColor,
                ),
                child: Center(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: divColor,
              ),
              child: Center(
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
