import 'dart:async';

import 'package:flutter/material.dart';

import 'package:inflearn_flutter_image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'components/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    // 짧은 딜레이를 줌 = 퓨쳐.마이크로태스크
    Future.microtask(() {});
    //  인잇스테이트에서 watch 사용 불가(터짐) -> 리드 사용해야함
    final viewModel = context.read<HomeViewModel>();
    _subscription = viewModel.eventStream.listen((event) {
      event.when(showSnackBar: (message) {
        final snackBar = SnackBar(content: Text(message));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });
  }

  @override
  void dispose() {
    //계속 살아있으면 안되니까 종료해줌.
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      context.read<HomeViewModel>().fetch(_controller.text);
                    },
                    icon: const Icon(Icons.search)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Consumer<HomeViewModel>(
            builder: (_, viewModel, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: viewModel.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final photo = viewModel.photos[index];
                    return ImageWidget(
                      photo: photo,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
