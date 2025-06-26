import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/screens/auth.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldPage(
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HyperlinkButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          FluentPageRoute(
                            builder: (context) => AuthScreen(isLogin: true),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.isPressed) {
                            return Colors.white.withValues(alpha: 0.7);
                          }
                          return Colors.white;
                        }),
                      ),
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ThemeColors.backgroundColor,
                        ThemeColors.gradientEdgeColor,
                      ],
                      stops: [0.95, 0.98],
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(25),
                    // child: Image.asset('assets/images/welcome1.png'),
                    child: Lottie.asset('assets/animations/savings_2.json'),
                  ),
                ),
              ),
              Card(
                padding: EdgeInsets.fromLTRB(40, 30, 40, 25),
                backgroundColor: ThemeColors.backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // spacing: 35,
                  children: [
                    // SizedBox(height: 10),
                    const Text(
                      "Always take control of your finances",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "Finances must be arranged to set a better lifestyle in future",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          FluentPageRoute(
                            builder: (context) => AuthScreen(isLogin: false),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                        ),
                        // shape: WidgetStateProperty.all(
                        //   RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(18.0),
                        //   ),
                        // ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
