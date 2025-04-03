import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/widgets/text_box_with_icon.dart';
import 'package:flutter_expense_tracker/expenses/screens/dashboard.dart';

class AuthScreen extends StatefulWidget {
  final bool isLogin;

  const AuthScreen({super.key, required this.isLogin});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    try {
      if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
        debugPrint("Form is not valid");
        return;
      }

      // if (_passwordController.text != _confirmPasswordController.text) {
      //   await displayInfoBar(
      //     context,
      //     builder: (context, close) {
      //       return InfoBar(
      //         title: const Text('Error: Passwords do not match'),
      //         action: IconButton(
      //           icon: const Icon(FluentIcons.clear),
      //           onPressed: close,
      //         ),
      //         severity: InfoBarSeverity.error,
      //       );
      //     },
      //   );
      //   return;
      // }

      _formKey.currentState!.save();

      await displayInfoBar(
        context,
        builder: (context, close) {
          return InfoBar(
            title: const Text('Success'),
            content: const Text('Successfully registered.'),
            action: IconButton(
              icon: const Icon(FluentIcons.clear),
              onPressed: close,
            ),
            severity: InfoBarSeverity.success,
          );
        },
      );

      if (!mounted) {
        return;
      }

      Navigator.of(
        context,
      ).push(FluentPageRoute(builder: (context) => DashboardScreen()));
    } catch (error) {
      debugPrint(error.toString());

      if (!mounted) {
        return;
      }

      await displayInfoBar(
        context,
        builder: (context, close) {
          return InfoBar(
            title: const Text(
              'Unable to register user. Please try again later.',
            ),
            action: IconButton(
              icon: const Icon(FluentIcons.clear),
              onPressed: close,
            ),
            severity: InfoBarSeverity.error,
          );
        },
      );
    }
  }

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
      content: SingleChildScrollView(
        child: Container(
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 30),
                Text("Create an account to track your expenses"),
                SizedBox(height: 10),
                TextBoxWithIcon(
                  formKey: _formKey,
                  textEditingController: _nameController,
                  placeholder: "Enter your name",
                  icon: FluentIcons.people_add,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    if (value.length < 3 || value.length > 50) {
                      return 'Name must be between 3 and 50 characters.';
                    }
                    return null;
                  },
                ),
                TextBoxWithIcon(
                  formKey: _formKey,
                  textEditingController: _emailController,
                  placeholder: "Enter your email",
                  icon: FluentIcons.mail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    return null;
                  },
                ),
                TextBoxWithIcon(
                  formKey: _formKey,
                  textEditingController: _passwordController,
                  placeholder: "Enter a password",
                  icon: FluentIcons.password_field,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    if (value.length < 6 || value.length > 50) {
                      return 'Password must be between 6 and 50 characters';
                    }
                    return null;
                  },
                ),
                TextBoxWithIcon(
                  formKey: _formKey,
                  textEditingController: _confirmPasswordController,
                  placeholder: "Re-enter the password",
                  icon: FluentIcons.password_field,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter the password.';
                    }
                    if (value.length < 6 || value.length > 50) {
                      return 'Password must be between 6 and 50 characters';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: _submitForm,
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
      ),
    );
  }
}
