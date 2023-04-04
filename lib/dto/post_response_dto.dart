class PostDto {
  // late 또는 ? 로 초기값 처리
  int? id;
  String? title;

  PostDto({required this.id, required this.title});

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title
  };

  factory PostDto.fromJson(Map<String, dynamic> json) => PostDto(
      id: json["id"],
      title: json["title"]
  );
}