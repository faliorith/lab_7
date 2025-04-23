// post_state.dart
part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState {}

final class FetchedPostState extends PostState {
  final List<Post> posts;
  const FetchedPostState(this.posts);

  @override
  List<Object> get props => [posts];
}

final class FailurePostState extends PostState {
  final String message;
  const FailurePostState(this.message);

  @override
  List<Object> get props => [message];
}
