import 'package:fluent_ui/fluent_ui.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  @override
  Widget build(BuildContext context) {
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
                  fontSize: 22,
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
                radius: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                'Abhiroop Santra',
                style: TextStyle(
                  fontSize: 24,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xE7E7E7FF),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
