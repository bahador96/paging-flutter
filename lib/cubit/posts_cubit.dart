import 'package:flutter_application_1/cubit/posts_state.dart';
import 'package:flutter_application_1/data/models/post_model.dart';
import 'package:flutter_application_1/data/repositories/posts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(PostsInitial());

  int page = 1;
  final PostsRepo repository;
  void loadPosts() async {
    if (state is PostsLoading) return;

    final currentState = state;
    var oldPosts = <PostModel>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }
    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    repository.fetchPosts(page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);
      emit(PostsLoaded(posts));
    });
  }
}
