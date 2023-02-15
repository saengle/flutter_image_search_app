import 'package:flutter/material.dart';

import '../../model/photo.dart';

class ImageWidget extends StatelessWidget {
  final Photo photo;

  const ImageWidget({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(photo.previewURL ?? ''))),
    );
  }
}
