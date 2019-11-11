import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ChaosColors {
  ChaosColors._();

  static const blue = Color(0xFF0194C9);
  static const darkBlue = Color(0xFF0F3B61);
  static const pale = Color(0xFFF7F7FF);
  static const coolGray = Color(0xFF757678);
  static const coolGrayLight = Color(0xFFE0E1E4);
  static const disabled = Color(0xFFB1B2B2);
  static const white = Color(0xFFFFFFFF);
}

class ChaosStyles {
  ChaosStyles._();

  static Diagnosticable hero = TextStyle(
      fontFamily: 'Fjalla One',
      fontWeight: FontWeight.w800,
      fontSize: 28,
      color: ChaosColors.blue
  );

  static Diagnosticable heroSub = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: ChaosColors.pale
  );

  static Diagnosticable toolbarButton = TextStyle(
      fontWeight: FontWeight.w400,
      color: ChaosColors.pale,
      fontSize: 12
  );
}