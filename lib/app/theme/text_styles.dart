import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/media_query_constants.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _getFont(BuildContext context, TextStyle style) {
    return GoogleFonts.poppins(textStyle: style);
  }

  static TextStyle h1Large(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1000 ? 40 : 28,
      fontWeight: FontWeight.w500,
      height: getWidth(context) > 1000 ? 40 / 28 : null,
    ),
  );

  static TextStyle h1(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1000 ? 28 : 18,
      fontWeight: FontWeight.w500,
      height: getWidth(context) > 1000 ? 24 / 28 : null,
    ),
  );

  static TextStyle h2(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1050 ? 24 : 18,
      fontWeight: FontWeight.w500,
      height: getWidth(context) > 1050 ? 24 / 24 : null,
    ),
  );

  static TextStyle bodyLarge(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 600 ? 16 : 12,
      height: getWidth(context) > 600 ? 17 / 16 : null,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle bodyRegular(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1050 ? 14 : 12,
      height: getWidth(context) > 1050 ? 17 / 14 : null,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle h5(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1000 ? 20 : 12,
      height: getWidth(context) > 1000 ? 17 / 20 : null,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextStyle h6(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1000 ? 18 : 12,
      height: getWidth(context) > 1000 ? 17 / 18 : null,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextStyle bodySmall(BuildContext context) => _getFont(
    context,
    TextStyle(
      fontSize: getWidth(context) > 1000 ? 12 : 12,
      height: getWidth(context) > 1000 ? 17 / 12 : null,
      fontWeight: FontWeight.w400,
    ),
  );

  static BoxDecoration customBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        blurRadius: 3,
        spreadRadius: 3,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
