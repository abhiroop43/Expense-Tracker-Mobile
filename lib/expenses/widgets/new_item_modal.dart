import 'package:fluent_ui/fluent_ui.dart';

class NewItemModal extends StatefulWidget {
  const NewItemModal({super.key});

  @override
  State<NewItemModal> createState() => _NewItemModalState();
}

class _NewItemModalState extends State<NewItemModal> {
  @override
  Widget build(BuildContext context) {
    return Acrylic(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Add New Expense'),
            FilledButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
