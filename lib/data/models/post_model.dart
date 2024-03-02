class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  PostModel.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];
}
