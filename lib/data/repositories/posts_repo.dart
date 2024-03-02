import 'package:flutter_application_1/data/models/post_model.dart';
import 'package:flutter_application_1/data/services/post_service.dart';

class PostsRepo {
  final PostService service;

  PostsRepo(this.service);
  Future<List<PostModel>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);

    return posts.map((e) => PostModel.fromJson(e)).toList();
  }
}
