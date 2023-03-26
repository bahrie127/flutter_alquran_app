part of 'ayat_bloc.dart';

abstract class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

class AyatInitial extends AyatState {}

class AyatLoading extends AyatState {}

class AyatLoaded extends AyatState {
  final SuratDetailModel detail;
  const AyatLoaded({
    required this.detail,
  });

  @override
  List<Object> get props => [detail];
}

class AyatError extends AyatState {
  final String message;
  const AyatError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
