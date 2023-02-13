import 'package:flutter/material.dart';
import 'package:inflearn_flutter_image_search_app/data/photo_provider.dart';
import 'package:inflearn_flutter_image_search_app/ui/home_view_model.dart';

import 'data/api.dart';
import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
