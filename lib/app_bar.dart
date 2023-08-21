import 'package:flutter/material.dart';
import 'package:flutter_application_4/app_body.dart';
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
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Cultural Quiz',
              style: GoogleFonts.getFont(
                'Roboto',
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                ),
              ),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              side: BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(20.0),
            child: CulturalQuiz(),
          ),
        ),
      ),
    );
  }
}
