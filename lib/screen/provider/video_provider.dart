import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier
{
  VideoPlayerController?  videoplayer;
  ChewieController? song;
  List Images = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.png",
  ];

  List videopath = [
    "assets/video/1.mp4",
    "assets/video/2.mp4",
    "assets/video/3.mp4",
    "assets/video/4.mp4",
    "assets/video/5.mp4",

  ];
  void videoload(int index)
  {
    videoplayer = VideoPlayerController.asset("${videopath[index]}")..initialize();
    song = ChewieController(videoPlayerController: videoplayer!,autoPlay: false,looping: false,allowPlaybackSpeedChanging: false,allowedScreenSleep: false,);
  }

  void pausesong()
  {
    song!.pause();
  }
}