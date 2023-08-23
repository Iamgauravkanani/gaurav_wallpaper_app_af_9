import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:wallpaper_app_af_9/Model/wallpaper_model.dart';
import 'package:wallpaper_app_af_9/Views/Components/Helpers/api_helper.dart';

class Wallpaper_Screen extends StatefulWidget {
  const Wallpaper_Screen({super.key});

  @override
  State<Wallpaper_Screen> createState() => _Wallpaper_ScreenState();
}

class _Wallpaper_ScreenState extends State<Wallpaper_Screen> {
  TextEditingController search_controller = TextEditingController();
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText("PixaBay App"),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Api_Helper.api_helper.getWallPaper(search_data: searchString),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<WallPaper>? wallpaper = snapshot.data;
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 45,
                  child: SearchBarAnimation(
                    buttonWidget: Icon(CupertinoIcons.search),
                    secondaryButtonWidget: Icon(Icons.search),
                    textEditingController: search_controller,
                    isOriginalAnimation: true,
                    buttonBorderColour: Colors.black45,
                    trailingWidget: Icon(Icons.search),
                    onFieldSubmitted: (String value) {
                      setState(() {
                        searchString = value;
                      });
                      search_controller.clear();
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 350,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: wallpaper!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "detail",
                                arguments: wallpaper[i]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(wallpaper[i].largeImageURL),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          }
          return Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://media.tenor.com/bC4aopuqkDAAAAAM/panda-cute.gif",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
