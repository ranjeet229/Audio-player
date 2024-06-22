import 'package:audio_player/Controller/Song%20data%20controller.dart';
import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:audio_player/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class SongControllerButton extends StatelessWidget {
  const SongControllerButton({super.key});

  @override
  Widget build(BuildContext context) {

    SongPlayerController songPlayerController=Get.put(SongPlayerController());
    SongDataController songDataController=Get.put(SongDataController());
    return SingleChildScrollView(
      child: Column(
        children: [

       Obx(() =>  Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("${songPlayerController.CurrentTime}",style: Theme.of(context).textTheme.labelMedium,),
           Expanded(
             child: Obx(() => Slider(
               value: songPlayerController.sliderValue.value.
                   clamp(0.0, songPlayerController.sliderValue.value),
               onChanged: (value){
                 songPlayerController.sliderValue.value=value;

                 Duration songPosition=Duration(seconds: value.toInt());
                 songPlayerController.changeSongSlider(songPosition);
               },
               min: 0,
               max: songPlayerController.sliderMaxValue.value,
             ),),
           ),
           Text("${songPlayerController.TotalTime}",style: Theme.of(context).textTheme.labelMedium,),
         ],
       ),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InkWell(
            onTap: (){
              songDataController.playPreviousSong();
            },
              child: SvgPicture.asset("assets/icons/back.svg",width: 25,)),
          SizedBox(width: 40,),
          Obx(() => songPlayerController.isPlaying.value
              ? InkWell(
                onTap: (){
                  songPlayerController.pausePlaying();
                },
                child: Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: primaryColor,
                            ),
                            child: Center(
                child:  SvgPicture.asset("assets/icons/pause.svg",width: 25,),
                            ),
                          ),
              ) : InkWell(
                  onTap: (){
                    songPlayerController.resumePlaying();
                  },
                  child: Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                            ),
                            child: Center(
                  child:  SvgPicture.asset("assets/icons/play.svg",width: 25,),
                            ),
                          ),
                  ),
              ),
                  SizedBox(width: 40,),
                  InkWell(
                    onTap: (){
                      songDataController.playNextSong();
                    },
                      child: SvgPicture.asset("assets/icons/next.svg",
                        width: 25,
                      )),
              ],
      
              ),
      
            SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            InkWell(
              onTap: (){
                songPlayerController.RandomSong();
              },
                child: Obx(() => SvgPicture.asset(
                  "assets/icons/suffle.svg",
                  width: 18,
                  color: songPlayerController.isSuffeled.value ? primaryColor : lableColor,

                )),
            ),

            InkWell(
              onTap: (){
                songPlayerController.setLoopSong();
              },
                child: Obx(() => SvgPicture.asset(
                  "assets/icons/repeat.svg",
                  width: 18,
                  color: songPlayerController.isLoop.value ? primaryColor : lableColor,
                )),
            ),
            SvgPicture.asset("assets/icons/songbook.svg",width: 18,),
            SvgPicture.asset("assets/images/heart.svg",width: 18,),
          ],
      
        ),
      
      ],),
    );
  }
}
