import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mix/repository/post_repository.dart';
import 'package:flutter_riverpod_mix/view/home/dto/home_page_response_dto.dart';
import 'package:flutter_riverpod_mix/view/home/home_page_view_model.dart';

// ref 접근 용
final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController {
  // homePagePostDto 를 창고에 넣으려면 ? ref 접근

  Ref ref;
  PostController(this.ref);
  Future<void> findPosts() async {
    List<HomePagePostDto> homePagePostDtos = await PostRepository().findAll();
    ref.read(homePageViewModel.notifier).state = HomePageModel(posts: homePagePostDtos);
  }
}