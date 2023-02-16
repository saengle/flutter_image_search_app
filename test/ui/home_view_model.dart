import 'package:flutter_test/flutter_test.dart';
import 'package:inflearn_flutter_image_search_app/data/data_source/result.dart';
import 'package:inflearn_flutter_image_search_app/domain/repository/photo_api_repository.dart';
import 'package:inflearn_flutter_image_search_app/domain/model/photo.dart';
import 'package:inflearn_flutter_image_search_app/presentation/home/home_view_model.dart';


void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    await viewModel.fetch('apple');
    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g29ada31e10cb9d1c62de01c6cc66dd8206a450a3f08ccb00048228682f879cbda036a19c2d007baeb049f7b317b106dd_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/ga4d52583e61b24f0f8756568d5b2c5d8d87d39f8bed054a369d092c7e26f9d799d8157348825cd8e91f32f4dd91e6870329d6c54b7111e20bbd1e4bbc8f59bd6_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 465371,
    "downloads": 270059,
    "collections": 1258,
    "likes": 2347,
    "comments": 192,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g1a9db46dd83d17c95b1083f135d478c3fbcb2bd074385a27c0cba9627b8dcde33ec472b336764a4160370200a917a6d6e31ef5d1c842c92470631af2cf39a177_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g1586b03568ba3b219963bb2c5e2f59aef52f06590bb19e4df9a77eaa861dfc29445b996b609dee096debb7a0d56df203ff21be5479cc4ccb19ad030529a9f2e0_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 672603,
    "downloads": 488534,
    "collections": 1361,
    "likes": 1019,
    "comments": 272,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  }
];
