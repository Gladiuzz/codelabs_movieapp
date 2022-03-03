import 'package:bloc/bloc.dart';
import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movienewplaying_state.dart';

class MovienewplayingCubit extends Cubit<MovienewplayingState> {
  final MovieService _movieService;

  MovienewplayingCubit(this._movieService) : super(MovienewplayingInitial());

  Future<void> fetchMoviePlaying() async {
    try {
      emit(MovienewplayingLoading());

      List<MovieModel> listMovie = await _movieService.getMoviePlaying();

      emit(MovienewplayingSuccess(listMovie));
    } catch (e) {
      emit(MovienewplayingFailed(e.toString()));
    }
  }
}
