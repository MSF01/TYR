import 'package:flutter/material.dart';

const MaterialColor primarycolor =
    MaterialColor(_primarycolorPrimaryValue, <int, Color>{
  50: Color(0xFFF7F7F8),
  100: Color(0xFFECECEE),
  200: Color(0xFFDFDFE2),
  300: Color(0xFFD2D2D6),
  400: Color(0xFFC8C9CE),
  500: Color(_primarycolorPrimaryValue),
  600: Color(0xFFB8B9BF),
  700: Color(0xFFAFB1B8),
  800: Color(0xFFA7A9B0),
  900: Color(0xFF999BA3),
});
const int _primarycolorPrimaryValue = 0xFFBEBFC5;

const MaterialColor primarycolorAccent =
    MaterialColor(_primarycolorAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primarycolorAccentValue),
  400: Color(0xFFDFE5FF),
  700: Color(0xFFC6D0FF),
});
const int _primarycolorAccentValue = 0xFFFFFFFF;
