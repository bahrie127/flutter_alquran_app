import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_ahlul_quran_app/data/api_service.dart';

import '../../data/models/surat_detail_model.dart';

part 'ayat_event.dart';
part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final ApiService apiService;
  AyatBloc(
    this.apiService,
  ) : super(AyatInitial()) {
    on<AyatGetEvent>((event, emit) async {
      emit(AyatLoading());
      final result = await apiService.getDetailSurat(event.noSurat);

      result.fold(
        (l) => emit(AyatError(message: l)),
        (r) => emit(AyatLoaded(detail: r)),
      );
    });
  }
}
