import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ahlul_quran_app/data/api_service.dart';
import 'package:flutter_ahlul_quran_app/data/models/surat_detail_model.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(
    this.apiService,
  ) : super(AyatInitial());

  final ApiService apiService;

  void getDetailSurat(int noSurat) async {
    emit(AyatLoading());
    final result = await apiService.getDetailSurat(noSurat);

    result.fold(
      (l) => emit(AyatError(message: l)),
      (r) => emit(AyatLoaded(detail: r)),
    );
  }
}
