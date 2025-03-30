import 'package:fluent_ui/fluent_ui.dart';

class AuthScreen extends StatefulWidget {
  final bool isLogin;

  const AuthScreen({super.key, required this.isLogin});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      // header: PreferredSize(
      //   preferredSize: Size.fromHeight(5),
      //   child: AppBar(backgroundColor: Color(0xFF272727)),
      // ),
      header: Container(
        margin: EdgeInsets.fromLTRB(15, 35, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(FluentIcons.chevron_left_med, size: 18.0),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFF666666)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      content: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Let's\nGet Started",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
