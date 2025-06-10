import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedFile;

  void _selectReceiptImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      return;
    }

    setState(() {
      _selectedFile = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget? content = Button(
      onPressed: _selectReceiptImage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FluentIcons.camera, size: screenHeight * 0.02),
          SizedBox(width: screenHeight * 0.02),
          Text(
            'Select Receipt',
            style: TextStyle(fontSize: screenHeight * 0.015),
          ),
        ],
      ),
    );

    if (_selectedFile != null) {
      content = GestureDetector(
        onTap: _selectReceiptImage,
        child: Image.file(
          _selectedFile!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.primaryColor.withAlpha(80),
          width: 1,
        ),
      ),
      height: screenHeight * 0.3,
      width: double.infinity,
      alignment: Alignment.center,

      child: SizedBox(width: screenWidth * 0.5, child: content),
    );
  }
}
