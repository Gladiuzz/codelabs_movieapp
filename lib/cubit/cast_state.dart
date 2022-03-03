part of 'cast_cubit.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccess extends CastState {
  final List<CastModel> cast;

  CastSuccess(this.cast);

  @override
  List<Object> get props => [cast];
}

class CastFailed extends CastState {
  final String error;

  CastFailed(this.error);

  @override
  List<Object> get props => [error];
}
