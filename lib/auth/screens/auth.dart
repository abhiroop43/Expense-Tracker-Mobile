import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/widgets/text_box_with_icon.dart';

class AuthScreen extends StatefulWidget {
  final bool isLogin;

  const AuthScreen({super.key, required this.isLogin});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 30),
              Text("Create an account to track your expenses"),
              SizedBox(height: 10),
              TextBoxWithIcon(
                textEditingController: nameController,
                placeholder: "Enter your name",
                icon: FluentIcons.people_add,
                keyboardType: TextInputType.name,
              ),
              TextBoxWithIcon(
                textEditingController: nameController,
                placeholder: "Enter your email",
                icon: FluentIcons.mail,
                keyboardType: TextInputType.name,
              ),
              TextBoxWithIcon(
                textEditingController: nameController,
                placeholder: "Enter a password",
                icon: FluentIcons.password_field,
                keyboardType: TextInputType.name,
              ),
              TextBoxWithIcon(
                textEditingController: nameController,
                placeholder: "Re-enter the password",
                icon: FluentIcons.password_field,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () {},
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
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
