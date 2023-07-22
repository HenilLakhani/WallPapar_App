import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/post_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String api = "http://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpapers({String query = "nature"}) async {
    String wallpaperApi =
        "https://pixabay.com/api/?key=36872636-bdff19555b8046e9250e90c56&q=$query";
    http.Response response = await http.get(Uri.parse(wallpaperApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List allData = data['hits'];

      return allData;
    }
    return null;
  }

  Future<Posts?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      Posts post = Posts.fromMap(data: data);

      return post;
    }
    return null;
  }

  Future<List<Posts>?> getMultipleResponce() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);

      List<Posts> allPost = allData.map((e) => Posts.fromMap(data: e)).toList();

      return allPost;
    }
    return null;
  }
}
