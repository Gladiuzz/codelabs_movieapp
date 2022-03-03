import 'package:bloc/bloc.dart';
import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'moviePopular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  final MovieService _movieService;

  MoviePopularCubit(this._movieService) : super(MoviePopularInitial());

  Future<void> fetchMoviePopular() async {
    try {
      emit(MoviePopularLoading());

      List<MovieModel> listMovie = await _movieService.getMoviePopular();

      emit(MoviePopularSuccess(listMovie));
    } catch (e) {
      emit(MoviePopularFailed(e.toString()));
    }
  }
}
