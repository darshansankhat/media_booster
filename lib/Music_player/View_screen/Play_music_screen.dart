import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider_screen/Music_provider.dart';

class Play_music extends StatefulWidget {
  const Play_music({Key? key}) : super(key: key);

  @override
  State<Play_music> createState() => _Play_musicState();
}

class _Play_musicState extends State<Play_music> {
  Music_provider? providerF;
  Music_provider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<Music_provider>(context, listen: false).initAudio();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Music_provider>(context, listen: false);
    providerT = Provider.of<Music_provider>(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Music Player",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: Column(
          children: [
            //image
            SizedBox(height: 70),
            Container(
              height: 35.h,
              width: 70.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("${providerT!.musicList[providerT!.choiceIndex].img}"),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
              ),
            ),
            //name
            SizedBox(height: 20),
            Text(
              "${providerT!.musicList[providerT!.choiceIndex].name}",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            //singar
            SizedBox(height: 10),
            Text(
              "${providerT!.musicList[providerT!.choiceIndex].singar}",
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
            //slider
            SizedBox(height: 20),
            PlayerBuilder.currentPosition(
              player: providerF!.assetsAudioPlayer!,
              builder: (context, position) => Column(
                children: [
                  Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    max: providerT!.duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      position = Duration(seconds: value.toInt());
                      providerT!.assetsAudioPlayer!.seek(position);
                    },
                  ),
                  //timer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${position}"),
                        Text("${providerT!.duration}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //option
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shuffle, size: 25),
                ),
                IconButton(
                  onPressed: () {
                    providerT!.privies();
                  },
                  icon: Icon(Icons.skip_previous, size: 30),
                ),
                InkWell(
                  onTap: () {
                    if (providerT!.assetsAudioPlayer.isPlaying.value) {
                      providerF!.pauseAudio();
                    } else {
                      providerF!.playAudio();
                    }
                  },
                  child: providerT!.d
                      ? Icon(
                          Icons.pause,
                          size: 60,
                        )
                      : Icon(
                          Icons.play_arrow,
                          size: 60,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    providerT!.next();
                  },
                  icon: Icon(Icons.skip_next, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.loop, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 7.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.black,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white54),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "UP NEXT",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  "LYRICS",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  "RELATED",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
