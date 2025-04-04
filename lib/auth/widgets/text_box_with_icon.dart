import 'package:fluent_ui/fluent_ui.dart';

class TextBoxWithIcon extends StatelessWidget {
  final TextEditingController textEditingController;
  final String placeholder;
  final IconData icon;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final GlobalKey<FormState> formKey;

  const TextBoxWithIcon({
    super.key,
    required this.textEditingController,
    required this.placeholder,
    required this.icon,
    required this.keyboardType,
    this.validator,
    this.isPassword = false,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormBox(
        keyboardType: keyboardType,
        obscureText: isPassword,
        obscuringCharacter: '*',
        autocorrect: !isPassword,
        maxLength: 50,
        controller: textEditingController,
        placeholder: placeholder,
        expands: false,
        style: TextStyle(height: 2.5),
        padding: EdgeInsets.fromLTRB(12, 8, 12, 12),
        prefix: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 4.0),
          child: Icon(icon, size: 25), // Replace with your desired icon
        ),
        validator: validator,
      ),
    );
  }
}
