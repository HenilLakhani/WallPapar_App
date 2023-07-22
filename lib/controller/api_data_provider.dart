import 'package:flutter/cupertino.dart';
import 'package:hsjfkjshj/controller/helpers/api_helpers.dart';
import 'package:hsjfkjshj/models/post_model.dart';

class ApiController extends ChangeNotifier {
  Posts? post;

  List data = [];

  ApiController() {
    search();
  }

  Future<void> getData() async {
    post = await ApiHelper.apiHelper.getSingleResponse();
    notifyListeners();
  }

  search({String val = "nature"}) async {
    data = await ApiHelper.apiHelper.getWallpapers(query: val) ?? [];
    notifyListeners();
  }
}
