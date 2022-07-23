import 'dart:convert';

import 'package:api_builder/modals/albums.dart';
import 'package:http/http.dart';

extension Success on Response {
  bool get isSuccessfull => statusCode == 200;
}

class AlbumApiServices {
  final baseURL = 'https://jsonplaceholder.typicode.com';
  final apiURL = '/albums';
  Future<List<Album>> fetchAblums() async {
    var response = await get(Uri.parse(baseURL + apiURL));
    if (response.isSuccessfull) {
      List data = jsonDecode(response.body);
      return data.map((map) => Album.fromMap(map)).toList();
    } else {
      return [];
    }
  }
}
