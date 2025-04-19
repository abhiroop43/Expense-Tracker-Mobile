import 'package:fluent_ui/fluent_ui.dart';

class TransactionItemIcon extends StatelessWidget {
  final String transactionType;

  const TransactionItemIcon({super.key, required this.transactionType});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData icon;

    switch (transactionType) {
      case "Health":
        backgroundColor = Colors.red;
        icon = FluentIcons.heart_fill;
        break;
      case "Clothing":
        backgroundColor = Color.fromARGB(255, 83, 46, 255);
        icon = FluentIcons.shirt;
        break;
      case "Income":
        backgroundColor = Colors.green;
        icon = FluentIcons.money;
        break;
      case "Savings":
        backgroundColor = Color.fromARGB(255, 0, 135, 22);
        icon = FluentIcons.bank_solid;
        break;
      case "Dining":
        backgroundColor = Color.fromARGB(255, 143, 0, 0);
        icon = FluentIcons.eat_drink;
        break;
      case "Personal":
        backgroundColor = Color.fromARGB(255, 0, 105, 217);
        icon = FluentIcons.contact;
        break;
      case "Insurance":
        backgroundColor = Color.fromARGB(255, 178, 122, 5);
        icon = FluentIcons.articles;
        break;
      case "Others":
        backgroundColor = Color.fromARGB(255, 66, 43, 43);
        icon = FluentIcons.arrow_tall_up_right;
        break;
      default:
        backgroundColor = Color.fromARGB(255, 194, 80, 1);
        icon = FluentIcons.lightning_bolt_solid;
        break;
    }

    return Card(
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: Icon(icon, color: Colors.white),
    );
  }
}
