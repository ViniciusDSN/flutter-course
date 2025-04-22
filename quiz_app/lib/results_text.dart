import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsText extends StatelessWidget {
  const ResultsText(this.text, this.color, this.textAlign, {super.key});

  final TextAlign textAlign;
  final String text;
  final Color color;

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.rubik(
        fontSize: 16, 
        color: color,
      ),
    );
  }
}