import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mix/controller/post_controller.dart';
import 'package:flutter_riverpod_mix/view/pages/post/home/post_home_page_view_model.dart';
import '../../../../model/post/post.dart';

// DI 고민해보기
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pc = ref.read(postController);
    PostHomePageModel? pm = ref.watch(postHomePageProvider); //list 가 들어와 있고,

    return Scaffold(
      body: Column(
        children: [
            // 여기 표현식을 넣어줘야 함 if는 표현식이 아니당
            Expanded(
              child: pm != null
                  ? buildListView(pm.posts)
                  : buildListView([]),
            ),
          // ListView 는 높이가 필요
          ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, "/login");
              pc.findPosts();
            },
            child: Text("페이지로드"),
          )
        ],
      ),
    );
  }

  Widget buildListView(List<Post> posts) {
    return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text("${posts[index].id}"),
                      title: Text("${posts[index].title}"),
                    ),
                  );
  }
}
