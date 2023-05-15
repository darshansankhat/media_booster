import 'package:flutter/material.dart';
import 'package:media_booster/Vidio_player/Provider_screen/Video_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Video_home_screen extends StatefulWidget {
  const Video_home_screen({Key? key}) : super(key: key);

  @override
  State<Video_home_screen> createState() => _Video_home_screenState();
}

class _Video_home_screenState extends State<Video_home_screen> {

  Video_provider? providerF;
  Video_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Video_provider>(context,listen: false);
    providerT=Provider.of<Video_provider>(context,listen: true);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Video Player",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 5,
              width: 10.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500), color: Colors.black),
            ),
            //video
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {

                    Provider.of<Video_provider>(context,listen: false).loadVideo("${providerT!.videoList[index].path}");
                    Navigator.pushNamed(context, "video",arguments: index);

                  },child: video(index));
                },
                itemCount: 10,
              ),
            )
          ],
        ));
  }

  Widget video(int index) {
    return Container(
      height: 22.h,
      width: 100.w,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        image: DecorationImage(image: AssetImage("${providerT!.videoList[index].img}"),fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text("${providerT!.videoList[index].name}",style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
    );
  }
}
