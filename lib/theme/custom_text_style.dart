import 'package:flutter/material.dart';
import 'package:carwash/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineLargeKufamOrange400d1 =>
      theme.textTheme.headlineLarge!.kufam.copyWith(
        color: appTheme.orange400D1,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeSemiBold => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeIndigo400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.indigo400,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeRedA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA700,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get kufam {
    return copyWith(
      fontFamily: 'Kufam',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
