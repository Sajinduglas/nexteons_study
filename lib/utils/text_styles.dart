import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class GlTextStyles {
  static interStyl({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.inter(
      fontSize: size ?? 20,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? ColorTheme.black,
    );
  }
}