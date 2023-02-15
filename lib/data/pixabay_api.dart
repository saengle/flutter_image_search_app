import 'dart:convert';

import 'package:inflearn_flutter_image_search_app/data/photo_api_repository.dart';

import '../env/env.dart';
import '../model/photo.dart';

import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api/';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    // if(client == null) {client = http.Client()}
    // 아래 코드 같은 내용 (줄여쓰기)
    client ??= http.Client();
    final response = await client.get(Uri.parse(
      // http.get -> client.get 변경  : client 가 있으면 client를 사용, 없을시 기본 http.Client(가 원래 기본값)를 사용
        '$baseUrl?key=${Env.Image_Key}&q=$query&image_type=photo&pretty=true'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
