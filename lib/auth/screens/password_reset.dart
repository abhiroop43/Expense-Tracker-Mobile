import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/auth/widgets/text_box_with_icon.dart';
import 'package:flutter_expense_tracker/common/extensions.dart';

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

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ScaffoldPage(
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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

              FilledButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: screenWidth * 0.3,
                    ),
                  ),
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
