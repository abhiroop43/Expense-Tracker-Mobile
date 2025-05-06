import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/expenses/widgets/edit_profile_modal.dart';
import 'package:flutter_expense_tracker/expenses/widgets/privacy_policy_modal.dart';
import 'package:flutter_expense_tracker/expenses/widgets/settings_modal.dart';

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
    Widget? modalWidget;

    switch (buttonType) {
      case "Edit Profile":
        backgroundColor = Color.fromARGB(255, 93, 0, 185);
        icon = FluentIcons.contact;
        modalWidget = const EditProfileModal();
        break;
      case "Settings":
        backgroundColor = Color.fromARGB(255, 0, 103, 45);
        icon = FluentIcons.settings;
        modalWidget = const SettingsModal();
        break;
      case "Privacy Policy":
        backgroundColor = Color.fromARGB(255, 72, 69, 73);
        icon = FluentIcons.suitcase;
        modalWidget = const PrivacyPolicyModal();
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
      onPressed: () async {
        // Handle button tap
        debugPrint("Tapped on $buttonType");
        if (modalWidget != null) {
          showDialog(
            context: context,
            builder: (context) => modalWidget as Widget,
            barrierDismissible: true,
          );
        } else {
          // show logout dialog

          await showDialog<String>(
            context: context,
            builder:
                (context) => ContentDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    FilledButton(
                      onPressed: () {
                        debugPrint("Logout user");
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.isPressed) {
                            return Color.fromARGB(
                              255,
                              255,
                              108,
                              108,
                            ).withValues(alpha: 0.5);
                          }
                          return Color.fromARGB(255, 255, 108, 108);
                        }),
                      ),
                      child: const Text('Logout'),
                    ),

                    Button(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context, 'Logout dialog dismissed');
                        // Delete file here
                      },
                    ),
                  ],
                ),
          );
        }
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
