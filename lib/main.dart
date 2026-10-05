import 'package:flutter/material.dart';
// import 'column_widget.dart';
// import 'row_widget.dart';
// import 'first_widget.dart';
// import 'form_widget.dart';
// import 'app_theme.dart';
// import 'responsive_profile.dart';
import 'assets_media.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assets Media & Navigation',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D63D9),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AssetsMediaPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}