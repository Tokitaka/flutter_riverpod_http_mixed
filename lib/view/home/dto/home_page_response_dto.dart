class HomePagePostDto {
  // late 또는 ? 로 초기값 처리
  int? id;
  String? title;

  HomePagePostDto({required this.id, required this.title});

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title
  };

  factory HomePagePostDto.fromJson(Map<String, dynamic> json) => HomePagePostDto(
      id: json["id"],
      title: json["title"]
  );
}