import 'package:flutter/cupertino.dart';

import '../ui/home_view_model.dart';


class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;
  const PhotoProvider( {
    super.key,
    required super.child,
    required this.viewModel,
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
    return true;
  }
}
