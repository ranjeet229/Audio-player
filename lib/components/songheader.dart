
import 'package:flutter/material.dart';

class SongPageHeader extends StatelessWidget {
  const SongPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/music.png',
          width: 40,
        ),
        SizedBox(width: 12,),
        Text('MUSIC',style: TextStyle(
          fontSize: 25,

        ),),

      ],
    );

  }
}
