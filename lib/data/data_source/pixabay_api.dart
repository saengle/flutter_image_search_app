import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../env/env.dart';

class PixabayApi {
  final http.Client client;


  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';

  Future<Iterable> fetch(String query) async {

    final response =  await client.get(Uri.parse(
        '$baseUrl?key=${Env.Image_Key}&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits;
  }

}