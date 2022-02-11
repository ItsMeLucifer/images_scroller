import 'dart:convert';

import 'package:images_scroller_assignment/models/photo.dart';
import 'package:images_scroller_assignment/utilities/url_helper.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Photo>> fetchPhotos() async {
    final url = Uri.parse(UrlHelper.urlForPhotos);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse;
      return results.map((jsonPhoto) => Photo.fromJSON(jsonPhoto)).toList();
    } else {
      throw Exception('Failed to fetch photos from server');
    }
  }
}
