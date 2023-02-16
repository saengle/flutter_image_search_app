import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

import '../../data/data_source/result.dart';
import '../../domain/repository/photo_api_repository.dart';
import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  //List<Photo> get photos 사용시
//getter 사용시 밖에서 homeviewmodel.photos = []; 같은 변환은 막혀있으나, homeviewmodel.photos.add() 나 .clear 같은
// 명령어들은 사용이 가능함 ->   UnmodifiableListView<Photo> get photos 는 실행은 가능하나, 에러로 수행되서 잘못됌을 알려줌 (add 나 clear 같은기능사용시)
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);



  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(
      success: (result) {
        _photos = result;
        notifyListeners();
      },
      error: (message) {
        print('네트워크 에러');
      },
    );
  }
}
