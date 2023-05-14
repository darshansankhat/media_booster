import 'package:flutter/material.dart';
import 'package:media_booster/Bottom_provider/Bottom_provider.dart';
import 'package:provider/provider.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({Key? key}) : super(key: key);

  @override
  State<Bottom_navigation> createState() => _Bottom_navigationState();
}

class _Bottom_navigationState extends State<Bottom_navigation> {

  Bottom_provider? providerF;
  Bottom_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Bottom_provider>(context,listen: false);
    providerT=Provider.of<Bottom_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: providerT!.sceenList[providerT!.i],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: providerT!.i,
          onTap: (value) {
            providerF!.select_Screen(value);
          },
          backgroundColor: Colors.indigo.shade900,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined), label: "Music Player"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                label: "Video Player"),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_outlined), label: "Staggered"),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration), label: "Login ui"),
          ],
        ),
      ),
    );
  }
}
