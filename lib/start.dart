import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/screens/auth.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
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
                      foregroundColor: WidgetStateProperty.all(Colors.white),
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
                    colors: [Color(0xFF272727), Color(0xFF404040)],
                    stops: [0.95, 0.98],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: Image.asset('assets/images/welcome1.png'),
                ),
              ),
            ),
            Card(
              padding: EdgeInsets.fromLTRB(40, 30, 40, 25),
              backgroundColor: Color(0xFF191919),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // spacing: 35,
                children: [
                  // SizedBox(height: 10),
                  const Text(
                    "Always take control of your finances",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Finances must be arranged to set a better lifestyle in future",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
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
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
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
    );
  }
}
