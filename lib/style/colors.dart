// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColor {
  static List<Color?> lightColors = [
    const Color(0xFFeaecf7),
    const Color(0xFFd1e1d1),
    const Color(0xFFe9eaec),
    const Color(0xFFf5cbd9),
    const Color(0xFFc8edf9),
    const Color(0xFFdfedf4),
    const Color(0xFFe8deef),
    const Color(0xFFbfeae6),
    const Color(0xFFf4dbc3),
  ];

  static List<Color?> darkColors = [
    const Color(0xFF15161E),
    const Color(0xFF1D8B60),
    const Color(0xFF16171D),
    const Color(0xFF0A343E),
    const Color(0xFF371512),
    const Color(0xFF202B25),
    const Color(0xFF171620),
    const Color(0xFF402D19),
    const Color(0xFF0B243C),
  ];

  static List<Color?> getColors(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightColors : darkColors;
  }
}
