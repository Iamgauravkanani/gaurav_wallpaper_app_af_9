import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wallpaper_app_af_9/Model/api_model.dart';
import 'package:wallpaper_app_af_9/Views/Components/Helpers/api_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText('Good Morning,'),
            TyperAnimatedText('Bhargav'),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Api_Helper.api_helper.GetSingleData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            ApiModel? api_data = snapshot.data;
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text("${api_data!.title}"),
                subtitle: Text("${api_data.body}"),
                leading: Text("${api_data.id}"),
                trailing: Text("${api_data.userId}"),
              ),
            );
          }
          return Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.dribbble.com/users/100142/screenshots/2920352/loading-animation-cd-v2.gif",
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
