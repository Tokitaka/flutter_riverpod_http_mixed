class Post{
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  //Json을 object로 바꾸어줌
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body'],
    );
  }
  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body
    };
  }
}
// DB model로 null 허용해주고 필요한 데이터만 받자
// View에다가 넣어놓으면 앱 종료하면 데이터가 다 날라간다 ㅠ ? 메모리 아까워서
// 메모리 누수 , 앱은 하나의 프로세스만 사용한다
// 모든 앱들이 하나의 프로세스로 돈다 -> 프로세스는 하나고 View에 있는 데이터들은 파괴되고 살릴려면, store에 데이터를 저장해야 한다
// 가로 모드는 view가 파괴되고 랜더링 다시 해야 한다
// 이 모든 것을 리버팟을 쓰면 Store에서 데이터를 관리하니까 데이터 관리, 메모리 누수에 신경쓰지 않아도 된다