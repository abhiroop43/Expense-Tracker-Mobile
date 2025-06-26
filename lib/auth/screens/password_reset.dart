import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/widgets/text_box_with_icon.dart';
import 'package:flutter_expense_tracker/common/extensions.dart';
import 'package:lottie/lottie.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
            title: const Text('A password reset link has been sent'),
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

      Navigator.of(context).pop();
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
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      content: Container(
        margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Lottie.asset(
                'assets/animations/forgot_password.json',
                height: 200,
                fit: BoxFit.scaleDown,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Let's get\nback online",
              //       style: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.w900,
              //       ),
              //     ),
              //     SizedBox(width: 10),
              //   ],
              // ),
              SizedBox(height: 30),
              Text("Enter your email to reset your password"),
              SizedBox(height: 10),

              TextBoxWithIcon(
                formKey: _formKey,
                textEditingController: _emailController,
                placeholder: 'john.doe@example.com',
                icon: FluentIcons.accounts,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'An email id is required';
                  }

                  if (!value.isValidEmail()) {
                    return 'A valid email id is required';
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
                    ),
                    child: Text(
                      "Reset Password",
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
