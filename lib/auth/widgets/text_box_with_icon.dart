import 'package:fluent_ui/fluent_ui.dart';

class TextBoxWithIcon extends StatefulWidget {
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
  State<TextBoxWithIcon> createState() => _TextBoxWithIconState();
}

class _TextBoxWithIconState extends State<TextBoxWithIcon> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    void checkError() {
      if (widget.validator != null) {
        final error = widget.validator!(widget.textEditingController.text);
        setState(() {
          hasError = error != null;
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Focus(
        onFocusChange: (focused) {
          if (!focused) {
            checkError();
          }
        },
        child: TextFormBox(
          onChanged: (value) {
            checkError();
          },
          onEditingComplete: () {
            checkError();
          },
          onTap: () {
            checkError();
          },
          onFieldSubmitted: (value) {
            checkError();
          },
          onSaved: (value) {
            checkError();
          },
          keyboardType: widget.keyboardType,
          highlightColor: Colors.transparent,
          unfocusedColor: Colors.transparent,
          errorHighlightColor: Colors.red,
          // foregroundDecoration: WidgetStateProperty.all(
          //   BoxDecoration(
          //     border: Border.all(color: Colors.white),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          // ),
          obscureText: widget.isPassword,
          obscuringCharacter: '*',
          autocorrect: !widget.isPassword,
          maxLength: 50,
          controller: widget.textEditingController,
          placeholder: widget.placeholder,
          expands: false,
          style: TextStyle(height: 2.5),
          padding: EdgeInsets.fromLTRB(12, 8, 12, 12),
          prefix: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 4.0),
            child: Icon(
              widget.icon,
              size: 25,
            ), // Replace with your desired icon
          ),
          decoration: WidgetStateProperty.all(
            BoxDecoration(
              border: Border.all(color: hasError ? Colors.red : Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
