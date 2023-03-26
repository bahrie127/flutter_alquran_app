import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/bloc/ayat/ayat_bloc.dart';

import 'package:flutter_ahlul_quran_app/data/models/surat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/contants.dart';

class AyatPage extends StatefulWidget {
  const AyatPage({
    Key? key,
    required this.surat,
  }) : super(key: key);
  final SuratModel surat;

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    // context.read<AyatCubit>().getDetailSurat(widget.surat.nomor);
    context.read<AyatBloc>().add(AyatGetEvent(noSurat: widget.surat.nomor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surat.namaLatin,
        ),
      ),
      body: BlocBuilder<AyatBloc, AyatState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyatLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayat = state.detail.ayat![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Text(
                        '${ayat.nomor}',
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    title: Text(
                      '${ayat.ar}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${ayat.idn}'),
                  ),
                );
              },
              itemCount: state.detail.ayat!.length,
            );
          }
          if (state is AyatError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('no data'),
          );
        },
      ),
    );
  }
}
