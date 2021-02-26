import 'package:cloudy/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.greenAccent,
    textTheme: TextTheme(
      headline1: GoogleFonts.poiretOne(fontSize: 130, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle1: GoogleFonts.poiretOne(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
      bodyText2 : GoogleFonts.poiretOne(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      subtitle2 : GoogleFonts.orbitron(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,),
    )
  ),
  home: MyApp(),
));
