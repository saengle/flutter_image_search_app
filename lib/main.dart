import 'package:flutter/material.dart';
import 'package:inflearn_flutter_image_search_app/data/data_source/pixabay_api.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/repository/photo_api_repository_impl.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/home/home_view_model.dart';


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
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PhotoApiRepositoryimpl(PixabayApi(http.Client()))),
        child: const HomeScreen(),
      ),
    );
  }
}
