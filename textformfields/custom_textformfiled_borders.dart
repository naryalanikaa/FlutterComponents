import 'package:flutter/material.dart';

class CommonInputFieldBorders {
  static UnderlineInputBorder underlineInputBorder(
      {double? borderRadius, Color? color}) {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
        borderSide: BorderSide(
          width: 1.0,
          color: color ?? AppColors.primary,
        ));
  }

  static OutlineInputBorder outlineInputBorder(
      {double? borderRadius, Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
        borderSide: BorderSide(
          width: 1.0,
          color: color ?? AppColors.primary,
        ));
  }
}
