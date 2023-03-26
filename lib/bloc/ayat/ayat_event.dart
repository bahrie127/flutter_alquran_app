part of 'ayat_bloc.dart';

abstract class AyatEvent extends Equatable {
  const AyatEvent();

  @override
  List<Object> get props => [];
}

class AyatGetEvent extends AyatEvent {
  final int noSurat;
  const AyatGetEvent({
    required this.noSurat,
  });
}
