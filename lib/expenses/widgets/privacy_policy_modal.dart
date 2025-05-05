import 'package:fluent_ui/fluent_ui.dart';

class PrivacyPolicyModal extends StatefulWidget {
  const PrivacyPolicyModal({super.key});

  @override
  State<PrivacyPolicyModal> createState() => _PrivacyPolicyModalState();
}

class _PrivacyPolicyModalState extends State<PrivacyPolicyModal> {
  @override
  Widget build(BuildContext context) {
    return Acrylic(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Privacy Policy'),
            FilledButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
