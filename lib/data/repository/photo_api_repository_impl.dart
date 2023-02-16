import 'package:inflearn_flutter_image_search_app/data/data_source/pixabay_api.dart';
import 'package:inflearn_flutter_image_search_app/domain/repository/photo_api_repository.dart';

import '../../domain/model/photo.dart';

class PhotoApiRepositoryimpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryimpl(this.api);


  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
