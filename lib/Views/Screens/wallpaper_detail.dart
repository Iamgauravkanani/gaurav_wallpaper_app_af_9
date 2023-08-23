import 'package:flutter/material.dart';
import 'package:wallpaper_app_af_9/Model/wallpaper_model.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  TextStyle textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    WallPaper wallPaper =
        ModalRoute.of(context)!.settings.arguments as WallPaper;
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Wall Paper"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: h * 0.7,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: NetworkImage(wallPaper.largeImageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "VIEWS : ${wallPaper.views}",
            style: textStyle,
          ),
          Text(
            "LIKES : ${wallPaper.likes}",
            style: textStyle,
          ),
          ElevatedButton(
            onPressed: () async {
              await AsyncWallpaper.setWallpaper(
                url: wallPaper.largeImageURL,
                wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                goToHome: true,
              );
            },
            child: Text("Set WallPaper"),
          ),
        ],
      ),
    );
  }
}
