import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Ahlul Quran App',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            home: const HomePage(),
          );
        });
  }
}
