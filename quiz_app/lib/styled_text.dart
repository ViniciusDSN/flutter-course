import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final TextAlign textAlign = TextAlign.center;
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.rubik(
        fontSize: 24,
        color: const Color.fromARGB(200, 255, 255, 255),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}