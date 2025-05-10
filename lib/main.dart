import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:flutter_expense_tracker/start.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      child: FluentApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: FluentThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
          brightness: Brightness.dark,
          accentColor: AccentColor.swatch({'normal': ThemeColors.primaryColor}),
          scaffoldBackgroundColor: ThemeColors.backgroundColor,
        ),
        theme: FluentThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
          accentColor: AccentColor.swatch({'normal': ThemeColors.primaryColor}),
        ),
        home: HomeScreen(), // StartScreen(),
      ),
    );
  }
}
