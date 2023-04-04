import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mix/controller/post_controller.dart';
import 'package:flutter_riverpod_mix/view/home/home_page_view_model.dart';

// DI 고민해보기
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pCon = ref.read(postController);
    HomePageModel hpm = ref.watch(homePageViewModel); //list 가 들어와 있고,

    return Scaffold(
      body: Column(
        children: [
          if (hpm.posts != null)
            // 여기 표현식을 넣어줘야 함 if 는 표현식이 아니당
            Expanded(
              child: hpm != null
                  ? ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => ListTile(
                        leading: Text("1"),
                        title: Text("제목1"),
                      ),
                    )
                  : child: CircularProgressIndicator(),
            ),
          // ListView 는 높이가 필요
          ElevatedButton(
            onPressed: () {
              pCon.findPosts();
            },
            child: Text("페이지로드"),
          )
        ],
      ),
    );
  }
}
