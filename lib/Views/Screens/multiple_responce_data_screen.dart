import 'package:flutter/material.dart';
import 'package:wallpaper_app_af_9/Model/api_model.dart';
import 'package:wallpaper_app_af_9/Views/Components/Helpers/api_helper.dart';

class Multiple_Data extends StatefulWidget {
  const Multiple_Data({super.key});

  @override
  State<Multiple_Data> createState() => _Multiple_DataState();
}

class _Multiple_DataState extends State<Multiple_Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Data"),
      ),
      body: FutureBuilder(
        future: Api_Helper.api_helper.GetAllData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<ApiModel>? allData = snapshot.data;
            return ListView.builder(
              itemCount: allData!.length,
              itemBuilder: (ctx, i) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      "${allData[i].title}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("${allData[i].body}"),
                    leading: Text(
                      "${allData[i].id}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text("${allData[i].userId}"),
                  ),
                );
              },
            );
          }
          return Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://media.tenor.com/iObT3GnpRUEAAAAC/hi-dog.gif",
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
