import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.text});
  late final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.mcLaren(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
