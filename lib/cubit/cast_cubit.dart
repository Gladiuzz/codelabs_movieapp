import 'package:bloc/bloc.dart';
import 'package:codelabs_movieapp/models/cast_model.dart';
import 'package:codelabs_movieapp/services/cast_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final CastService _castService;

  CastCubit(this._castService) : super(CastInitial());

  Future<void> fetchCast(id) async {
    try {
      emit(CastLoading());

      List<CastModel> listCast = await _castService.getCast(id);

      emit(CastSuccess(listCast));
    } catch (e) {
      emit(CastFailed(e.toString()));
    }
  }
}
