import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/expenses/widgets/profile_buttons.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  @override
  Widget build(BuildContext context) {
    // screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // responsive sizes
    double avatarRadius = screenWidth * 0.25;
    double titleFontSize = screenWidth * 0.06;
    double subtitleFontSize = screenWidth * 0.035;
    // double buttonHeight = screenHeight * 0.07;

    List<String> options = [
      "Edit Profile",
      "Settings",
      "Privacy Policy",
      "Logout",
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  "https://play-lh.googleusercontent.com/hJGHtbYSQ0nCnoEsK6AGojonjELeAh_Huxg361mVrPmzdwm8Ots-JzEH5488IS2nojI",
                ),
                // AssetImage('assets/images/avatar1.jpeg'),
                radius: avatarRadius,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                'Abhiroop Santra',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                'abhiroop.santra@gmail.com',
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w300,
                  color: Color(0xE7E7E7FF),
                ),
              ),
            ),

            // SizedBox(height: 20),
            SizedBox(
              height: screenHeight * 0.3,
              width: screenWidth,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileButtons(
                    screenWidth: screenWidth,
                    buttonType: options[index],
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(1.0),
                      // child: const Divider(),
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
