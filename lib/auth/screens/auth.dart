import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/screens/password_reset.dart';
import 'package:flutter_expense_tracker/auth/widgets/text_box_with_icon.dart';
import 'package:flutter_expense_tracker/common/extensions.dart';
import 'package:flutter_expense_tracker/expenses/screens/home.dart';
import 'package:flutter_expense_tracker/start.dart';
import 'package:lottie/lottie.dart';

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

      _formKey.currentState!.save();

      await displayInfoBar(
        context,
        builder: (context, close) {
          return InfoBar(
            title: const Text('Success'),
            content: Text(
              widget.isLogin
                  ? 'Successfully logged in'
                  : 'Successfully registered.',
            ),
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
      ).push(FluentPageRoute(builder: (context) => HomeScreen()));
    } catch (error) {
      debugPrint(error.toString());

      if (!mounted) {
        return;
      }

      await displayInfoBar(
        context,
        builder: (context, close) {
          return InfoBar(
            title: const Text('Error'),
            content: const Text('Please try again later.'),
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
      header: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(FluentIcons.chevron_left_med, size: 18.0),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFF515151)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed:
                  () => Navigator.of(context).pushAndRemoveUntil(
                    FluentPageRoute(builder: (context) => StartScreen()),
                    (route) => false,
                  ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  widget.isLogin
                      ? 'assets/animations/login.json'
                      : 'assets/animations/register.json',
                  height: 250,
                  fit: BoxFit.scaleDown,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       widget.isLogin
                //           ? "Hey,\nWelcome Back"
                //           : "Let's\nGet Started",
                //       style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.w900,
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //   ],
                // ),
                SizedBox(height: 30),
                Text(
                  widget.isLogin
                      ? "Login now to track all your expenses"
                      : "Create an account to track your expenses",
                ),
                SizedBox(height: 10),
                if (!widget.isLogin)
                  TextBoxWithIcon(
                    formKey: _formKey,
                    textEditingController: _nameController,
                    placeholder: "Enter your name",
                    icon: FluentIcons.contact,
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
                  icon: FluentIcons.accounts,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    // check if valid email format
                    if (!value.isValidEmail()) {
                      return 'Please enter a valid email address.';
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

                if (!widget.isLogin)
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
                if (widget.isLogin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      HyperlinkButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            FluentPageRoute(
                              builder: (context) => PasswordResetScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        child: const Text("Forgot Password?"),
                      ),
                    ],
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
                        // shape: WidgetStateProperty.all(
                        //   RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(18.0),
                        //   ),
                        // ),
                      ),
                      child: Text(
                        widget.isLogin ? "Login" : "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !widget.isLogin
                          ? "Already have an account?"
                          : "Don't have an account?",
                    ),
                    HyperlinkButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          FluentPageRoute(
                            builder:
                                (context) =>
                                    AuthScreen(isLogin: !widget.isLogin),
                          ),
                        );
                      },
                      child: Text(!widget.isLogin ? "Login" : "Sign up"),
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
