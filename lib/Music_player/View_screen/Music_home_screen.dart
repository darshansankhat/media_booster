import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider_screen/Music_provider.dart';

class Music_home_screen extends StatefulWidget {
  const Music_home_screen({Key? key}) : super(key: key);

  @override
  State<Music_home_screen> createState() => _Music_home_screenState();
}

class _Music_home_screenState extends State<Music_home_screen> {

  Music_provider? providerF;
  Music_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF = Provider.of<Music_provider>(context, listen: false);
    providerT = Provider.of<Music_provider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                  Text(
                    "Music Player",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
              //new single
              SizedBox(height: 10),
              Text(
                "New Single",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/image/Music_home/t.png"),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Liston Now",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              //most played
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Played",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 22.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      providerT!.choiceIndex=index;
                      Navigator.pushNamed(context, "play",arguments: index);
                    },child: most(index));
                  },
                  itemCount: providerT!.musicList.length,
                ),
              ),
              //play list
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Play List",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 22.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      providerT!.choiceIndex=index;
                      Navigator.pushNamed(context, "play",arguments: index);
                    },child: play(index));
                  },
                  itemCount: 3,
                ),
              ),
              //Mood
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mood",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  mood("Relax"),
                  mood("Energize"),
                  mood("Workout"),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget most(int index) {
    return Container(
      height: 22.h,
      width: 28.w,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(image: AssetImage("${providerT!.musicList[index].img}"),fit: BoxFit.cover)
            ),
          ),
          Text(
            "${providerT!.musicList[index].name}",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "${providerT!.musicList[index].singar}",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget play(int index) {
    return Container(
      height: 22.h,
      width: 28.w,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
                image: DecorationImage(image: AssetImage("${providerT!.musicList[index].img}"),fit: BoxFit.cover)
            ),
          ),
          Text(
            "${providerT!.musicList[index].name}",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "${providerT!.musicList[index].singar}",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget mood(String data) {
    return Container(
      height: 5.h,
      width: 29.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white70),
      alignment: Alignment.center,
      child: Text("$data",style: TextStyle(color: Colors.black,fontSize: 18),),
    );
  }
}
