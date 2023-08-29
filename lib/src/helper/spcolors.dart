import 'package:flutter/material.dart';

class SPColors {
  static MaterialColor get primary => const MaterialColor(0xff359D86, {
        50: Color(0xffe6fff4),
        100: Color(0xffF2FBF7),
        200: Color.fromARGB(255, 208, 255, 235),
        300: Color(0xff0ccb97),
        400: Color(0xff10bb8c),
        500: Color(0xff359D86),
        600: Color(0xff2d9767),
        700: Color(0xff2f9e6c),
        800: Color.fromARGB(255, 0, 75, 66),
        900: Color(0xff003c35),
      });

  var sss = const Color.fromARGB(255, 0, 75, 66);
  var ss2 = const Color(0xff003c35);

  static TextStyle get lightTextColor12 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 12,
    );
  }

  static TextStyle get lightTextColor14 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 14,
    );
  }

  static TextStyle get lightTextColor16 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 16,
    );
  }

  static TextStyle get lightTextColor18 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 18,
    );
  }

  static TextStyle get lightTextColor20 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 20,
    );
  }

  static TextStyle get lightTextColor22 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 22,
    );
  }

  static TextStyle get lightTextColor24 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 24,
    );
  }

  static TextStyle get lightTextColor26 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 26,
    );
  }

  static TextStyle get lightTextColor28 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 28,
    );
  }

  static TextStyle get lightTextColor30 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 30,
    );
  }

  static TextStyle get lightTextColor32 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 32,
    );
  }

  static TextStyle get lightTextColor34 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 34,
    );
  }

  static TextStyle get lightTextColor36 {
    return TextStyle(
      color: SPColors.primary.shade50,
      fontSize: 36,
    );
  }

  static TextStyle get darkTextColor12 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 12,
    );
  }

  static TextStyle get darkTextColor14 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 14,
    );
  }

  static TextStyle get darkTextColor16 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 16,
    );
  }

  static TextStyle get darkTextColor18 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 18,
    );
  }

  static TextStyle get darkTextColor20 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 20,
    );
  }

  static TextStyle get darkTextColor22 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 22,
    );
  }

  static TextStyle get darkTextColor24 {
    return TextStyle(
        color: SPColors.primary.shade900,
        fontSize: 24,
        fontWeight: FontWeight.bold);
  }

  static TextStyle get darkTextColor26 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 26,
    );
  }

  static TextStyle get darkTextColor28 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 28,
    );
  }

  static TextStyle get darkTextColor30 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 30,
    );
  }

  static TextStyle get darkTextColor32 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 32,
    );
  }

  static TextStyle get darkTextColor34 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 34,
    );
  }

  static TextStyle get darkTextColor36 {
    return TextStyle(
      color: SPColors.primary.shade900,
      fontSize: 36,
    );
  }

  static Color get green => const Color.fromARGB(255, 35, 182, 104);
  static Color get blue => const Color.fromARGB(255, 0, 122, 255);

  static List<BoxShadow> get boxShadowOrgMedium => [
        BoxShadow(
          color: SPColors.shadow.shade800,
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
      ];
  static List<BoxShadow> get boxShadowSmall => [
        BoxShadow(
          color: SPColors.shadow.shade500,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get boxShadowMedium => [
        BoxShadow(
          color: SPColors.shadow.shade500,
          blurRadius: 7,
          offset: const Offset(0, 4),
        ),
      ];
  static List<BoxShadow> get boxShadowLarge => [
        BoxShadow(
          color: SPColors.shadow.shade500,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ];

  static MaterialColor get white => const MaterialColor(0xfff7f6f5, {
        50: Color(0xffFFFFFF),
        100: Color(0xff727c8e),
        200: Color(0xff727c8e),
        300: Color(0xff727c8e),
        400: Color(0xff727c8e),
        500: Color(0xfff7f6f5),
        600: Color(0xffe8e5e3),
        700: Color(0xff727C8E),
        800: Color(0xff727c8e),
        900: Color(0xff727c8e),
      });

  static MaterialColor get bg => const MaterialColor(0xfff7f6f5, {
        50: Color(0xffffffff),
        100: Color(0xffe6fff4),
        200: Color.fromARGB(255, 208, 255, 235),
        300: Color(0xff0ccb97),
        400: Color(0xff10bb8c),
        500: Color(0xfff7f6f5),
        600: Color(0xffe8e5e3),
        700: Color(0xffc8c5c3),
        800: Color(0xff1D1F23),
        900: Color(0xff002042),
      });

  static MaterialColor get text => const MaterialColor(0xff505862, {
        50: Color(0xffffffff),
        100: Color(0xffF7F6F5),
        200: Color.fromARGB(255, 208, 255, 235),
        300: Color(0xff727c8e),
        400: Color(0xff727C8E),
        500: Color(0xff545454),
        600: Color(0xff002042),
        700: Color.fromARGB(255, 33, 48, 64),
        800: Color(0xff002042),
        900: Color(0xff002042),
      });

  static MaterialColor get shadow => const MaterialColor(0x40000000, {
        50: Color(0x00000000),
        100: Color(0x05000000),
        200: Color(0x10000000),
        300: Color(0x20000000),
        400: Color(0x30000000),
        500: Color(0x40000000),
        600: Color(0x60000000),
        700: Color(0x70000000),
        800: Color(0x80E7EAF0),
        900: Color(0x90000000),
      });

  static Gradient get gradientWhite => const LinearGradient(
        colors: [
          Color(0xfff7f6f5),
          Color.fromARGB(255, 232, 233, 236),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static Gradient gradientWithOpacity(Gradient gradient, double opacity) {
    return LinearGradient(
      colors: gradient.colors
          .map((color) => color.withOpacity(opacity))
          .toList(growable: false),
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static Gradient get gradientOrange => const LinearGradient(
        colors: [
          Color(0xffFFAE4E),
          Color(0xffFF7676),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );

  static Gradient get gradientPrimary => const LinearGradient(
        colors: [
          Color(0xffBF0E08),
          Color(0xffA50F0A),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );

  static Gradient get gradientBlue => const LinearGradient(
        colors: [
          Color(0xff76BAFF),
          Color(0xff76BAFF),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );
  static Gradient get gradientGreen => const LinearGradient(
        colors: [
          Color(0xff2FC145),
          Color(0xff8ACB32),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );

  static Gradient get gradientYellow => const LinearGradient(
        colors: [
          Color(0xffE6B15C),
          Color(0xffFFF84E),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );
}

// 