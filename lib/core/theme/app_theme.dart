import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  //====================== Theme switcher and Central Access Point ===============
  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;

}