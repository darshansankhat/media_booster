import 'package:flutter/material.dart';
import 'package:media_booster/Bottom_provider/Bottom_provider.dart';
import 'package:media_booster/Music_player/Provider_screen/Music_provider.dart';
import 'package:media_booster/Music_player/View_screen/Play_music_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'botom_navigation_bar/Botom_navigation.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Bottom_provider(),),
          ChangeNotifierProvider(create: (context) => Music_provider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => Bottom_navigation(),
            "play":(context) => Play_music(),
          },
          theme: ThemeData.dark(),
        ),
      ),
    ),
  );
}