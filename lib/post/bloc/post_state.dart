part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState {}

final class FetchedPostState extends PostState{}

final class FailurePostState extends PostState{}

