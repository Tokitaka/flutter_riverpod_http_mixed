import 'package:flutter_riverpod_mix/model/post/post.dart';

import '../../dto/post/post_response_dto.dart';

/*통신한척 repositpry 꾸리기*/
class PostRepository {
  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository(){
    return _instance;
  }
  // 근데 Post랑 User로 해결이 안되는건 dto를 새로 파라 근데 원래 정석은 화면 마다 dto 를 파는 것
  // 코드는 오른쪽부터 실행 PostRepository 생성자가 때려지고 밑에 팩토리 메서드에 초기에 null 이 들어가니까 _single 로 만들어줘야 함
  Future<List<Post>> findAll() {
    // Future를 만들어서 1초 있다가 return 에 있는 데이터 반환
    return Future.delayed(Duration(seconds: 1), () {
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
    // 통신 안했으니까 Future 객체 return 못하는데 ?
  }

  Future<void>? save() {
    return null;
  }
}