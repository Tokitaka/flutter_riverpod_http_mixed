/*homepage 관리 프로바이더 + 창고 = view_model*/
/*HomePageModel -> Dto model , HomePageViewModel은 창고로서 HomePageModel 객체를 관리하고, homePageViewModel은 Provider*/
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/post_response_dto.dart';

// Provider 1)
// 다이렉트 하게 접근하는 유일한 객체
final homePageViewModel =
    StateNotifierProvider<HomePageViewModel, HomePageModel?>((ref) {
  return HomePageViewModel(null); // 2차 수정 , 왜 null 넣지 ?? - 상태값을 null을 허용하려고
});

// Store, store가 가지고 있는 메서드들을 활용해서 Provider는 창고를 관리한다 2)
class HomePageViewModel extends StateNotifier<HomePageModel?> {
  HomePageViewModel(super.state);
}

// Stored data 3)
// HomePage model 이니까, 값을 List로 가져와야 한다
// dart는 내부 클래스가 불가능하다
// 창고 데이터 클래스를 따로 관리하는 이유는 ? 여러 가지 데이터 타입을 추가할 수 있기 때문
class HomePageModel {
  List<PostDto> posts; // Post는 어디에 만들어야 제일 효율적일까?
  HomePageModel({required this.posts}); // 항상 선택적 매개변수 {} 로 받는다
}



/*
* 1) Provider는 창고를 관리하고 창고는 창고데이터를 관리한다
* 2) Provider에서 창고를 초기화 해준다 return */
