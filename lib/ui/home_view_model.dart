import 'dart:async';

import 'package:inflearn_flutter_image_search_app/data/api.dart';

import '../model/Photo.dart';

class HomeViewModel {
  final PixabayApi api;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}