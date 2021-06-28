import 'dart:ui';

class Utils {
  /// Convert hex color #000000 to [Color]
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}