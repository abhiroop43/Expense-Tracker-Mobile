import 'package:fluent_ui/fluent_ui.dart';

class EditProfileModal extends StatefulWidget {
  const EditProfileModal({super.key});

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    // screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // responsive sizes
    double avatarRadius = screenWidth * 0.25;
    double titleFontSize = screenWidth * 0.06;

    return Acrylic(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Text(
              'Edit Profile',
              textAlign: TextAlign.center,
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
          Expanded(
            // replace with SingleChildScrollView and Form
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: InfoLabel(
                    label: 'Enter your name:',
                    child: const TextBox(expands: false),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: InfoLabel(
                    label: 'Change password:',
                    child: const PasswordBox(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: InfoLabel(
                    label: 'Confirm new password:',
                    child: const PasswordBox(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: InfoLabel(
                    label: 'Date of birth',
                    child: Center(
                      child: DatePicker(
                        selected: dateOfBirth,
                        fieldFlex: const [2, 3, 2],
                        onChanged: (time) => setState(() => dateOfBirth = time),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                  child: FilledButton(
                    child: const Text('Update'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
