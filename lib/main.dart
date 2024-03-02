import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/posts_cubit.dart';
import 'package:flutter_application_1/data/repositories/posts_repo.dart';
import 'package:flutter_application_1/data/services/post_service.dart';
import 'package:flutter_application_1/posts_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    repository: PostsRepo(PostService()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.repository}) : super(key: key);

  final PostsRepo repository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostView(),
      ),
    );
  }
}
