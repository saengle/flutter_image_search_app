import 'package:flutter/cupertino.dart';
import 'package:inflearn_flutter_image_search_app/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  const PhotoProvider({
    super.key,
    required super.child,
    required this.api,
  });

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

//위젯이 변경이 되었는지 이전 상태와 변경된 상태를 비교
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
