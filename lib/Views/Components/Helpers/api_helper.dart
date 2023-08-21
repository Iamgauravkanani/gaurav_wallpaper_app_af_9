import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app_af_9/Model/api_model.dart';

class Api_Helper {
  //1.Create Private Constructor.
  Api_Helper._();

  //2.Create Singlton Object
  static Api_Helper api_helper = Api_Helper._();

  Future<ApiModel?> GetSingleData() async {
    var responce = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/5"),
    );
    if (responce.statusCode == 201) {
      var body = responce.body;
      Map decodedData = jsonDecode(body);
      ApiModel data = ApiModel.fromJson(data: decodedData);
      return data;
    } else {
      return null;
    }
  }
}
