import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_7/post/bloc/post_bloc.dart';
import 'package:flutter_lab_7/models/get_posts.dart';
import 'package:flutter_lab_7/post/repository/post_repository.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});
  
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  late PostBloc postBloc;

  @override
  void initState() {
    super.initState();
    final postRepository = PostRepository(); // Создаем экземпляр PostRepository
    postBloc = PostBloc(postRepository); // Передаем его в PostBloc
    postBloc.add(GetPostEvent());
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Посты'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.purple.shade800,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder(
        bloc: postBloc,
        builder: (BuildContext context, state) {
          if (state is PostInitial) {
            return const Center(
              child: Text("Нажмите для загрузки"),
            );
          }
          if (state is LoadingPostState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchedPostState) {
            posts = state.posts;
            return buildBody();
          }
          if (state is FailurePostState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Произошла ошибка при загрузке данных"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      postBloc.add(GetPostEvent());
                    },
                    child: const Text("Повторить"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Неизвестное состояние"),
          );
        }
      ),
    );
  }

  Widget buildBody() {
    if (posts.isEmpty) {
      return const Center(
        child: Text("Нет доступных постов"),
      );
    }
    
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(post.body),
              ],
            ),
          ),
        );
      },
    );
  }
}