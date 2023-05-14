import 'package:flutter/cupertino.dart';
import 'package:media_booster/Login_ui/View_screen/Login_home_screen.dart';
import 'package:media_booster/Music_player/View_screen/Music_home_screen.dart';
import 'package:media_booster/Staggered_ui/View_screen/Staggered_home_screen.dart';
import 'package:media_booster/Vidio_player/View_screen/Video_home_screen.dart';

class Bottom_provider extends ChangeNotifier
{
    int i=0;

    List sceenList=[
      Music_home_screen(),
      Video_home_screen(),
      Staggred_home_screen(),
      Login_home_screen(),
    ];

    void select_Screen(int value)
    {
      i=value;

      notifyListeners();
    }
}