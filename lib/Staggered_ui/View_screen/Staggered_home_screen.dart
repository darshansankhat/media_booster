import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:media_booster/Music_player/Provider_screen/Music_provider.dart';
import 'package:media_booster/Staggered_ui/Provider_screen/Staggered_provider.dart';
import 'package:media_booster/Vidio_player/Provider_screen/Video_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Staggred_home_screen extends StatefulWidget {
  const Staggred_home_screen({Key? key}) : super(key: key);

  @override
  State<Staggred_home_screen> createState() => _Staggred_home_screenState();
}

class _Staggred_home_screenState extends State<Staggred_home_screen> {

  Staggered_provider? providerF;
  Staggered_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Staggered_provider>(context,listen: false);
    providerT=Provider.of<Staggered_provider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Download My Images",style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
      body: MasonryGridView.count(
        itemCount: providerT!.imgList.length,
        crossAxisCount: 2, itemBuilder: (contcoext, index) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("${providerT!.imgList[index].img}"),
                ),
                Text(
                  "${providerT!.imgList[index].name}",
                  style: TextStyle(color: Colors.blue,fontSize: 18),
                ),
                SizedBox(height: 5,)
              ],
            ),
          ),
        );

      },

      ),
    );
  }
}
