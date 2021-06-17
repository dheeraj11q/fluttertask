import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeApi {
  static List carouselimages = [];

  static List images = [];

  static Future imagesget(int imagesCount) async {
    String url =
        "http://shibe.online/api/shibes?count=$imagesCount&urls=true&httpsUrls=true";

    final res = await http.get(url);

    var jsnres = json.decode(res.body);

    return jsnres;
  }
}
