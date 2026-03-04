import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioMangerProvider extends ChangeNotifier{

  String? currentPlayingUrl ;

  double currentVolume = 2.0 ;

  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false ;

  Future <void> play (String url ) async {

    if(currentPlayingUrl == url){

      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying ;
    }else {
      await player.stop();
      currentPlayingUrl = url ;
      await player.play(UrlSource(url),volume: currentVolume);
      isPlaying =true ;

    }
    notifyListeners();
}
 Future<void> stop ()async {
    await player.stop();
   currentPlayingUrl = null ;
    isPlaying = false ;
    notifyListeners();
 }
 Future <void> setVolume (double volume )async{
    currentVolume = volume ;
    await player.setVolume(volume);
    notifyListeners();
 }



}