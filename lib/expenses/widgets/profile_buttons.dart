import 'package:fluent_ui/fluent_ui.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
    required this.screenWidth,
    required this.buttonType,
  });

  final double screenWidth;
  final String buttonType;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData icon;

    switch (buttonType) {
      case "Edit Profile":
        backgroundColor = Color.fromARGB(255, 93, 0, 185);
        icon = FluentIcons.contact;
        break;
      case "Settings":
        backgroundColor = Color.fromARGB(255, 0, 103, 45);
        icon = FluentIcons.settings;
        break;
      case "Privacy Policy":
        backgroundColor = Color.fromARGB(255, 72, 69, 73);
        icon = FluentIcons.suitcase;
        break;
      case "Logout":
        backgroundColor = Color.fromARGB(255, 157, 36, 36);
        icon = FluentIcons.power_button;
        break;
      default:
        backgroundColor = Color.fromARGB(255, 93, 0, 185);
        icon = FluentIcons.arrow_tall_up_right;
        break;
    }

    return Button(
      onPressed: () {
        // Handle button tap
        debugPrint("Tapped on $buttonType");
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
        // elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.isHovered || states.isPressed) {
            return Colors.white.withValues(alpha: 0.2); // Feedback color
          }
          return Colors.transparent;
        }),
      ),
      child: SizedBox(
        width: screenWidth * 0.95,
        child: Row(
          children: [
            Card(
              padding: EdgeInsets.all(8),
              backgroundColor: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  buttonType,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(FluentIcons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
