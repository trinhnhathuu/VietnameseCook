import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Base text style sử dụng Google Fonts
  static TextStyle _baseTextStyle = GoogleFonts.robotoCondensed(
    color: Colors.black,
  );

  // Heading styles
  static TextStyle get h1 => _baseTextStyle.copyWith(
    fontSize: 72,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get h2 => _baseTextStyle.copyWith(
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get h3 => _baseTextStyle.copyWith(
    fontSize: 44,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get h4 => _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get h5 => _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get h6 => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get tagline => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Large text styles (22px)
  static TextStyle get largeLight => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get largeNormal => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get largeMedium => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get largeSemiBold => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get largeBold => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get largeExtraBold => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get largeLink => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  // Medium text styles (18px)
  static TextStyle get mediumLight => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get mediumNormal => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get mediumMedium => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get mediumSemiBold => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get mediumBold => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get mediumExtraBold => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get mediumLink => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  // Regular text styles (16px)
  static TextStyle get regularLight => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get regularNormal => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get regularMedium => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get regularSemiBold => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get regularBold => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get regularExtraBold => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get regularLink => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  // Tiny text styles (12px)
  static TextStyle get tinyLight => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get tinyNormal => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get tinyMedium => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get tinySemiBold => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get tinyBold => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get tinyExtraBold => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get tinyLink => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  // Helper methods for dynamic text styles
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withSize(TextStyle style, double fontSize) {
    return style.copyWith(fontSize: fontSize);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle withFontFamily(TextStyle style, String fontFamily) {
    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      color: style.color,
      decoration: style.decoration,
    );
  }

  // Phương thức để thay đổi font cho toàn bộ class
  static void setGlobalFont(String fontName) {
    _baseTextStyle = GoogleFonts.getFont(fontName, color: Colors.black);
  }

  // Phương thức để lấy TextTheme cho MaterialApp
  static TextTheme get textTheme => GoogleFonts.robotoCondensedTextTheme();
}