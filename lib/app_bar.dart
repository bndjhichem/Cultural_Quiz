import 'package:flutter/material.dart';
import 'package:Quiz_Cultural/app_body.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
            'Cultural Quiz',
            style: GoogleFonts.getFont(
              'Roboto',
              textStyle: GoogleFonts.openSans(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: CulturalQuiz(),
        ),
      ),
    );
  }
}
