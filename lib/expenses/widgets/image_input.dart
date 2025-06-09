import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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

      // child: IconButton(
      //   icon: Icon(FluentIcons.camera, size: screenHeight * 0.04),
      //   onPressed: () => debugPrint('pressed button'),
      // ),
      child: SizedBox(
        width: screenWidth * 0.5,
        child: Button(
          onPressed: () {},
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
        ),
      ),
    );
  }
}
