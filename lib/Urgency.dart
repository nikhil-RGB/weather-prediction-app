import 'package:flutter/painting.dart';

enum Urgency {
  NO(
    LinearGradient(colors: [const Color(0xFF71C3FF), const Color(0xFF1D5ACF)]),
  ),
  LOW(
    LinearGradient(colors: [const Color(0xFF60E14B), const Color(0xFF41B92E)]),
  ),
  MEDIUM(
    LinearGradient(colors: [const Color(0xFFF68D2C), const Color(0xFFCF5D1D)]),
  ),
  HIGH(
    LinearGradient(colors: [const Color(0xFFF62C2C), const Color(0xFFCF1D1D)]),
  );

  final LinearGradient bg;
  const Urgency(this.bg);
}
