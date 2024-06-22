
import 'package:audio_player/Controller/Song%20data%20controller.dart';
import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:audio_player/Controller/cloudSongController.dart';
import 'package:audio_player/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../pages/playSongPage.dart';
class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController=Get.put(CloudSongController());
    SongPlayerController songPlayerController=Get.put(SongPlayerController());
    SongDataController songDataController=Get.put(SongDataController());
    List<Widget> sliderItem=cloudSongController.TredingSongList.value.map((e) =>
        InkWell(
          onTap: (){
            songPlayerController.playCloudAudio(e);
            songDataController.findCurrentSongIndex(e.id!);
            Get.to(PlaySongPage());

          },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/sajni.jpg'),
            fit: BoxFit.cover,
          ),
          color: divColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:  Row(
                          children: [
                            Icon(Icons.music_note,size: 13,),
                            SizedBox(width: 8,),
                            Text('Trending',style: Theme.of(context).textTheme.labelLarge),
                          ],),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text('${e.title}',
                              maxLines: 1,
                              style:Theme.of(context).textTheme.labelLarge )),
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${e.artist}',style:Theme.of(context).textTheme.labelMedium ),
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),
    )).toList();
    return CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          height: 320,
          viewportFraction: 0.8,// it show one at a time
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index,value){},
          scrollDirection: Axis.horizontal,//it change the axis
        )
    );
  }
}
