import 'package:flutter/material.dart';
import 'package:media_booster/Bottom_provider/Bottom_provider.dart';
import 'package:media_booster/Login_ui/View_screen/Login_home_screen.dart';
import 'package:media_booster/Login_ui/View_screen/Login_sign_in.dart';
import 'package:media_booster/Login_ui/View_screen/Welcome_screen.dart';
import 'package:media_booster/Music_player/Provider_screen/Music_provider.dart';
import 'package:media_booster/Music_player/View_screen/Play_music_screen.dart';
import 'package:media_booster/Staggered_ui/Provider_screen/Staggered_provider.dart';
import 'package:media_booster/Vidio_player/Provider_screen/Video_provider.dart';
import 'package:media_booster/Vidio_player/View_screen/Play_video_screen.dart';
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
          ChangeNotifierProvider(create: (context) => Video_provider(),),
          ChangeNotifierProvider(create: (context) => Staggered_provider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => Bottom_navigation(),
            "play":(context) => Play_music(),
            "video":(context) => Play_vedeo(),
            "signin":(context) => Login_sign_in(),
            "signup":(context) => Login_home_screen(),
            "welcome":(context) => Welcome_screen(),
          },
          theme: ThemeData.dark(),
        ),
      ),
    ),
  );
}