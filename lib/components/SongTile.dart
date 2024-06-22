import 'package:audio_player/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key,required this.songName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: divColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.play_arrow),//this is arrow button
              //sized box used for giving space
              SizedBox(width: 10,),
              Flexible(
                  child: Text('$songName',
                      maxLines: 1,
                      style:Theme.of(context).textTheme.labelLarge )),
            ],
          ),
        ),
      ),
    );
  }
}
