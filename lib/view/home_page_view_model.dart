/*homepage 관리 프로바이더 + 창고 = view_model*/
/*HomePageModel -> Dto model , HomePageViewModel은 창고로서 HomePageModel 객체를 관리하고, homePageViewModel은 Provider*/
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
// 다이렉트 하게 접근하는 유일한 객체
final homePageViewModel =
    StateNotifierProvider<HomePageViewModel, HomePageModel>((ref) {
  return HomePageViewModel();
});

// Stored data
// HomePage model 이니까, 값을 List로 가져와야 한다
// dart는 내부 클래스가 불가능하다
class HomePageModel {
  List<Post> posts = []; // Post는 어디에 만들어야 제일 효율적일까?
}

// Store, store가 가지고 있는 메서드들을 활용해서 Provider는 창고를 관리한다
class HomePageViewModel extends StateNotifier<HomePageModel> {
  HomePageViewModel(super.state);
}
