import 'dart:convert';
import 'package:bb_earn_english/models/photo.dart';
import 'package:flutter/foundation.dart'; // using compute
import 'package:http/http.dart' as http;

List<Photo> parsePhoto(String responseBody) {
  var list =
      json.decode(responseBody) as List<dynamic>; // need import dart convert
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();

  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
  if (response.statusCode == 200) {
    return compute(parsePhoto, response.body);
  } else {
    throw Exception('Request API Error');
  }
}

var listPhotoSearch = [];

Future getDataPhoto() async {
  var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
  var responseBody = jsonDecode(response.body);
  for (int i = 0; i < responseBody.length; i++) {
    listPhotoSearch.add(responseBody[i]['title']);
  }

  print(listPhotoSearch);
}
