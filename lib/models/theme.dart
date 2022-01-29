import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.nunito(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.nunito(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.nunito(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.nunito(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    button: GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.nunito(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.nunito(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.nunito(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.nunito(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      unselectedWidgetColor: Colors.grey[400],
      toggleableActiveColor: Colors.pink[200],
      primaryColor: Colors.pink[200],
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor!,
        secondary: Colors.pink.shade200,
      ),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.alegreya(
          fontSize: 21.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.pink[200],
        unselectedItemColor: Colors.grey[400],
        selectedIconTheme: IconThemeData(
          color: Colors.pink[200],
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 50,
        backgroundColor: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.pink[300],
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.alegreya(
          fontSize: 21.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }

  static ThemeData getTheme(bool isDark) {
    return isDark ? dark() : light();
  }
}

class Theme with ChangeNotifier {
  bool? isDark;

  Theme({this.isDark});

  void toggleTheme() {
    isDark = !isDark!;
    notifyListeners();
  }
}
