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
        // focusTheme: FocusThemeData(
        //   borderRadius: BorderRadius.zero,
        //   glowColor: AccentColor.swatch({
        //     'normal': Color(0xFFbbff36),
        //   }).withValues(alpha: 0.2),
        //   glowFactor: 0.0,
        //   primaryBorder: BorderSide(width: 2.0, color: Colors.transparent),
        // ),
        fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
        brightness: Brightness.dark,
        accentColor: AccentColor.swatch({'normal': Color(0xFFA3E63B)}),
        scaffoldBackgroundColor: Color(0xFF171717),
      ),
      theme: FluentThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
        accentColor: AccentColor.swatch({'normal': Color(0xFFA3E63B)}),
      ),
      home: StartScreen(),
    );
  }
}
