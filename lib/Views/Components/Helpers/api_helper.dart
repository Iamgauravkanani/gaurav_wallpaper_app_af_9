import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app_af_9/Model/api_model.dart';
import 'package:wallpaper_app_af_9/Model/wallpaper_model.dart';

class Api_Helper {
  //1.Create Private Constructor.
  Api_Helper._();

  //2.Create Singlton Object
  static Api_Helper api_helper = Api_Helper._();

  Future<ApiModel?> GetSingleData() async {
    var responce = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/5"),
    );
    if (responce.statusCode == 200) {
      var body = responce.body;
      Map decodedData = jsonDecode(body);
      ApiModel data = ApiModel.fromJson(data: decodedData);
      return data;
    } else {
      return null;
    }
  }

  Future<List<ApiModel>?> GetAllData() async {
    String HosName = "https://jsonplaceholder.typicode.com";
    String Data_Type = "posts";
    String Api = "$HosName/$Data_Type";

    var responce = await http.get(
      Uri.parse(Api),
    );
    if (responce.statusCode == 200) {
      String body = responce.body;
      List decodedData = jsonDecode(body);
      List<ApiModel> data =
          decodedData.map((e) => ApiModel.fromJson(data: e)).toList();
      return data;
    } else {
      return null;
    }
  }

  Future<List<WallPaper>?> getWallPaper({required String search_data}) async {
    String HostName = "https://pixabay.com";
    String ApiKey = "38040191-6b9efd35438879dc1456204e4";
    String SearchData = search_data;
    String Api =
        "$HostName/api/?key=$ApiKey&q=$SearchData&image_type=photo&pretty=true";
    var responce = await http.get(Uri.parse(Api));

    if (responce.statusCode == 200) {
      String JsonData = responce.body;
      Map DecodedData = jsonDecode(JsonData);
      List mapData = DecodedData['hits'];
      List<WallPaper> wallpaper_data =
          mapData.map((e) => WallPaper.fromJson(data: e)).toList();

      return wallpaper_data;
    } else {
      return null;
    }
  }
}
