part of 'movienewplaying_cubit.dart';

abstract class MovienewplayingState extends Equatable {
  const MovienewplayingState();

  @override
  List<Object> get props => [];
}

class MovienewplayingInitial extends MovienewplayingState {}

class MovienewplayingLoading extends MovienewplayingState {}

class MovienewplayingSuccess extends MovienewplayingState {
  final List<MovieModel> movie;

  MovienewplayingSuccess(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovienewplayingFailed extends MovienewplayingState {
  final String error;

  MovienewplayingFailed(this.error);

  @override
  List<Object> get props => [error];
}
