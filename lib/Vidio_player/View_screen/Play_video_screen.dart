import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Provider_screen/Video_provider.dart';

class Play_vedeo extends StatefulWidget {
  const Play_vedeo({Key? key}) : super(key: key);

  @override
  State<Play_vedeo> createState() => _Play_vedeoState();
}

class _Play_vedeoState extends State<Play_vedeo> {

  Video_provider? providerF;
  Video_provider? providerT;


  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Video_provider>(context,listen: false);
    providerT=Provider.of<Video_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Chewie(
         controller: providerT!.chewieController!,
        ),
      ),
    );
  }
}
