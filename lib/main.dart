import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/start.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: FluentThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
        brightness: Brightness.dark,
        accentColor: AccentColor.swatch({'normal': Color(0xFFbbff36)}),
      ),
      theme: FluentThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
        accentColor: AccentColor.swatch({'normal': Color(0xFFbbff36)}),
      ),
      home: StartScreen(),
    );
  }
}
