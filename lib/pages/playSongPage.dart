import 'package:audio_player/components/SongControllerButton.dart';
import 'package:audio_player/components/SongDetails.dart';
import 'package:audio_player/components/SongWave.dart';
import 'package:audio_player/components/Volume.dart';
import 'package:audio_player/components/playSongheaderbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaySongPage extends StatelessWidget {


  const PlaySongPage({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    var value = 20.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const PlaySongHeaderButton(),
              const SizedBox(height: 10,),
              const SongAndVolume(),
              const SizedBox(height: 30,),
              SongDetails(),
              const SizedBox(height: 10,),
              const Spacer(),
              const SongControllerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
