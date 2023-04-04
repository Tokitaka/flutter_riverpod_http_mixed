import 'package:flutter_riverpod_mix/view/home/dto/home_page_response_dto.dart';

/*통신한척 repositpry 꾸리기*/
class PostRepository {
  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository(){
    return _instance;
  }

  // 코드는 오른쪽부터 실행 PostRepository 생성자가 때려지고 밑에 팩토리 메서드에 초기에 null 이 들어가니까 _single 로 만들어줘야 함
  Future<List<HomePagePostDto>> findAll() {
    // Future를 만들어서 1초 있다가 return 에 있는 데이터 반환
    return Future.delayed(Duration(seconds: 1), () {
      return [
        HomePagePostDto(id: 1, title: "제목1"),
        HomePagePostDto(id: 2, title: "제목2"),
        HomePagePostDto(id: 3, title: "제목3"),
      ];
    });
    // 통신 안했으니까 Future 객체 return 못하는데 ?
  }

  Future<void>? save() {
    return null;
  }
}