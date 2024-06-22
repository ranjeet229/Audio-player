import 'package:audio_player/Controller/SongPlayerController.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
class SongDataController extends GetxController{

  SongPlayerController songPlayerController= Get.put(SongPlayerController());

  final audioQuery = OnAudioQuery();

  RxList<SongModel> localsongList = <SongModel>[].obs;
  RxBool isDeviceSong=false.obs;
  RxInt currentSongPlayingIndex=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async{
    localsongList.value=await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL
    );
     //print(songList.value);
  }

  void storagePermission() async {
    try {
      var perm = await Permission.storage.request();
      if (perm.isGranted) {
        print('Permission granted');
        getLocalSongs();
      } else {
        print('Permission denied');
        await Permission.storage.request();
      }
    } catch (ex) {
      print(ex);
    }
  }

  void findCurrentSongIndex(int songId){
    var index=0;
    localsongList.forEach((e) {
      if(e.id==songId){
        currentSongPlayingIndex.value=index;
      }
      index++;
    });

    print(songId);
    print(currentSongPlayingIndex);
  }

  void playNextSong(){
    int songListLen=localsongList.length;
    currentSongPlayingIndex.value=currentSongPlayingIndex.value+1;

    if(currentSongPlayingIndex.value < songListLen){
      SongModel nextSong=localsongList[currentSongPlayingIndex.value];
      songPlayerController.playLocalAudio(nextSong);
    }

  }
  void playPreviousSong(){
    int songListLen=localsongList.length;
    if(currentSongPlayingIndex.value!=0){
      currentSongPlayingIndex.value= --currentSongPlayingIndex.value;
      if(currentSongPlayingIndex.value < songListLen){
        SongModel nextSong=localsongList[currentSongPlayingIndex.value];
        songPlayerController.playLocalAudio(nextSong);
      }

    }

  }

}