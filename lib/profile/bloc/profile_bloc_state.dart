part of 'profile_bloc_bloc.dart';

sealed class ProfileBlocState extends Equatable {
  const ProfileBlocState();
  
  @override
  List<Object> get props => [];
}

final class ProfileBlocInitial extends ProfileBlocState {}
