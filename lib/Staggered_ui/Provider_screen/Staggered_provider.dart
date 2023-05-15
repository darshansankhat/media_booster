import 'package:flutter/material.dart';
import 'package:media_booster/Staggered_ui/model_screen/Staggered_screen.dart';

class Staggered_provider extends ChangeNotifier
{
  List<Staggered_model> imgList=[
    Staggered_model(name: "Life is Small",img: "assets/image/staggered_img/s1.jpg"),
    Staggered_model(name: "Cat lover",img: "assets/image/staggered_img/s2.jpg",),
    Staggered_model(name: "Good Night",img: "assets/image/staggered_img/s3.jpg",),
    Staggered_model(name: "Jay Mahadev",img: "assets/image/staggered_img/s4.jpg",),
    Staggered_model(name: "Life is tough",img: "assets/image/staggered_img/s5.jpg",),
    Staggered_model(name: "Tree lover",img: "assets/image/staggered_img/s6.jpg",),
    Staggered_model(name: "Animal lover",img: "assets/image/staggered_img/s7.jpg",),
    Staggered_model(name: "Animal lover",img: "assets/image/staggered_img/s8.jpg",),
    Staggered_model(name: "Our home",img: "assets/image/staggered_img/s9.jpg"),
    Staggered_model(name: "Generate your image",img: "assets/image/staggered_img/s10.jpg",),
  ];
}