import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_7/models/get_posts.dart';
import 'package:flutter_lab_7/post/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<GetPostEvent>(_onGetPost);
  }

  Future<void> _onGetPost(GetPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingPostState());
    try {
      final posts = await repository.getPosts(); // Получаем список постов
      emit(FetchedPostState(posts)); // Управляем состоянием здесь
    } catch (e) {
      emit(FailurePostState('Ошибка загрузки постов: $e'));
    }
  }
}