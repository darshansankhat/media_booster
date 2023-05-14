import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Music_player/model_screen/Music_model.dart';

class Music_provider extends ChangeNotifier {

  List<Music_model> musicList=[
    Music_model(img: "assets/image/Music_home/m1.png",name: "Tara nano mane rang",singar: "Om Baraiya",),
    Music_model(img: "assets/image/Music_home/m2.png",name: "Mara malk na mena rani",singar: "Jignesh Kaviraj",),
    Music_model(img: "assets/image/Music_home/m3.png",name: "Pa Pa pagli",singar: "Sonu nigam",),
    Music_model(img: "assets/image/Music_home/m4.png",name: "Bhamariyalo",singar: "Umesh Barot",),
    Music_model(img: "assets/image/Music_home/m5.png",name: "JAnat ve",singar: "Darshan Raval",),
    Music_model(img: "assets/image/Music_home/m6.png",name: "Tane Joye me jyarthi",singar: "Umesh Barot",),
  ];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration(seconds: 0);
  bool d=false;
  int choiceIndex=0;

  void initAudio() {
    assetsAudioPlayer.open(
      Playlist(startIndex: choiceIndex, audios: [
        Audio("assets/audio/m1.mp3"),
        Audio("assets/audio/m2.mp3"),
        Audio("assets/audio/m3.mp3"),
        Audio("assets/audio/m4.mp3"),
        Audio("assets/audio/m5.mp3"),
        Audio("assets/audio/m6.mp3"),
      ],

      ),
      autoStart: false,
      showNotification: true,
    );
    durationAudio();
  }

  void playAudio()
  {
    assetsAudioPlayer.play();
    d=true;
    notifyListeners();
  }

  void pauseAudio()
  {
    assetsAudioPlayer.pause();
    d=false;
    notifyListeners();
  }

  void next()
  {
    assetsAudioPlayer.next();
    d=true;
    if(choiceIndex<4)
      {
        choiceIndex++;
      }
    else
      {
        choiceIndex=5;
      }
    notifyListeners();
  }

  void privies()
  {
    assetsAudioPlayer.previous();
    d=true;
    if(choiceIndex>0)
    {
      choiceIndex--;
    }
    else
      {
        choiceIndex=0;
      }
    notifyListeners();
  }

  void durationAudio()
  {
    assetsAudioPlayer.current.listen((event) {
      duration=event!.audio.duration;
    });
  }

}
