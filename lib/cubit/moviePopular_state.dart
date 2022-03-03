part of 'moviePopular_cubit.dart';

abstract class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object> get props => [];
}

class MoviePopularInitial extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {}

class MoviePopularSuccess extends MoviePopularState {
  final List<MovieModel> movie;

  MoviePopularSuccess(this.movie);

  @override
  List<Object> get props => [movie];
}

class MoviePopularFailed extends MoviePopularState {
  final String error;

  MoviePopularFailed(this.error);

  @override
  List<Object> get props => [error];
}
