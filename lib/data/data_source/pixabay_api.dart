import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../env/env.dart';
import 'result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client.get(Uri.parse(
          '$baseUrl?key=${Env.Image_Key}&q=$query&image_type=photo&pretty=true'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
