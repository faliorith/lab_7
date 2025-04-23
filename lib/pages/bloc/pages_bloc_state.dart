part of 'pages_bloc_bloc.dart';

sealed class PagesBlocState extends Equatable {
  const PagesBlocState();
  
  @override
  List<Object> get props => [];
}

final class PagesBlocInitial extends PagesBlocState {}
