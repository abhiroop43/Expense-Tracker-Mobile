import 'package:fluent_ui/fluent_ui.dart';

class EditProfileModal extends StatefulWidget {
  const EditProfileModal({super.key});

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  DateTime? dateOfBirth;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      debugPrint('Name: ${_nameController.text}');
      debugPrint('Password: ${_passwordController.text}');
      debugPrint('Re-entered Password: ${_rePasswordController.text}');
      debugPrint('Date of Birth: $dateOfBirth');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // responsive sizes
    double avatarRadius = screenWidth * 0.25;
    double titleFontSize = screenWidth * 0.06;

    return Acrylic(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.04),
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
              margin: EdgeInsets.only(top: screenHeight * 0.02),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  "https://play-lh.googleusercontent.com/hJGHtbYSQ0nCnoEsK6AGojonjELeAh_Huxg361mVrPmzdwm8Ots-JzEH5488IS2nojI",
                ),
                // AssetImage('assets/images/avatar1.jpeg'),
                radius: avatarRadius,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.04,
                    ),
                    child: TextFormBox(
                      expands: false,
                      controller: _nameController,
                      placeholder: 'Enter your name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.04,
                    ),
                    child: TextFormBox(
                      expands: false,
                      controller: _passwordController,
                      placeholder: 'Enter your password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.04,
                    ),
                    child: TextFormBox(
                      expands: false,
                      controller: _rePasswordController,
                      placeholder: 'Re-enter your password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please re-enter your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.04,
                    ),
                    child: InfoLabel(
                      label: 'Date of birth',
                      child: Center(
                        child: DatePicker(
                          selected: dateOfBirth,
                          fieldFlex: const [4, 5, 4],
                          onChanged:
                              (time) => setState(() => dateOfBirth = time),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    child: FilledButton(
                      child: const Text('Update'),
                      onPressed: () {
                        submitForm();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
