import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/start.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: Container(
        color: ThemeColors.backgroundColor,
        child: SafeArea(
          child: FluentApp(
            title: 'Expense Tracker',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            darkTheme: FluentThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
              brightness: Brightness.dark,
              accentColor: AccentColor.swatch({
                'normal': ThemeColors.primaryColor,
              }),
              scaffoldBackgroundColor: ThemeColors.backgroundColor,
            ),
            theme: FluentThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily ?? 'DefaultFont',
              accentColor: AccentColor.swatch({
                'normal': ThemeColors.primaryColor,
              }),
            ),
            home: StartScreen(),
          ),
        ),
      ),
    );
  }
}
