import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_booster/Vidio_player/model_screen/Video_model.dart';
import 'package:video_player/video_player.dart';

class Video_provider extends ChangeNotifier
{
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void loadVideo(String videoPath)
  {
    videoPlayerController = VideoPlayerController.asset("$videoPath")..initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        allowFullScreen: true,
        looping: true,
        autoPlay: true,
    );


  }

  List<Video_model> videoList=[
    Video_model(img: "assets/image/video_img/1.png",name: "Respect",path: "assets/video/v1.mp4",),
    Video_model(img: "assets/image/video_img/2.png",name: "Songs",path: "assets/video/v2.mp4",),
    Video_model(img: "assets/image/video_img/3.png",name: "Friendship",path: "assets/video/v3.mp4",),
    Video_model(img: "assets/image/video_img/4.png",name: "Boys",path: "assets/video/v4.mp4",),
    Video_model(img: "assets/image/video_img/5.png",name: "Motivation",path: "assets/video/v5.mp4",),
    Video_model(img: "assets/image/video_img/6.png",name: "D J 🎶",path: "assets/video/v6.mp4",),
    Video_model(img: "assets/image/video_img/7.png",name: "Magic",path: "assets/video/v7.mp4",),
    Video_model(img: "assets/image/video_img/8.png",name: "Love",path: "assets/video/v8.mp4",),
    Video_model(img: "assets/image/video_img/9.png",name: "Suprice",path: "assets/video/v9.mp4",),
    Video_model(img: "assets/image/video_img/10.png",name: "Indian",path: "assets/video/v10.mp4",),
  ];
}