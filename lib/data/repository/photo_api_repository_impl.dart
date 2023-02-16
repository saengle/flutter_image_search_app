import 'package:inflearn_flutter_image_search_app/data/data_source/pixabay_api.dart';
import 'package:inflearn_flutter_image_search_app/domain/repository/photo_api_repository.dart';

import '../../domain/model/photo.dart';
import '../data_source/result.dart';

class PhotoApiRepositoryimpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryimpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    //result 의 타입이 Success 인지, Error 인지 원래 if 문으로 체크 할것을
    //Freezed를 이용해서 만들었을 때 .when 을 이용해서 확인 가능 .
    //https://pub.dev/packages/freezed#union-types-and-sealed-classes
    //sealedclass 의 when 에서 확인 가능.
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
