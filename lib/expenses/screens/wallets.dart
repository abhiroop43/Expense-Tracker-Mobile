import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  @override
  Widget build(BuildContext context) {
    // screen dimensions
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.1),
            child: const Text(
              textAlign: TextAlign.center,
              '\$484.00',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: Text(
              textAlign: TextAlign.center,
              'Total Balance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: ThemeColors.walletCardColor1,
              ),
            ),
          ),
          Card(
            borderRadius: BorderRadius.circular(screenHeight * 0.05),
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            backgroundColor: ThemeColors.elementBackgroundColor,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: const Text('Side Hustle'),
                  subtitle: const Text('\$7.00'),
                  trailing: Icon(FluentIcons.chevron_right),
                  leading: Icon(
                    FluentIcons.money,
                    color: ThemeColors.walletCardColor1,
                  ),
                ),
                ListTile(
                  title: const Text('Freelancing'),
                  subtitle: const Text('\$50.00'),
                  trailing: Icon(FluentIcons.chevron_right),
                  leading: Icon(
                    FluentIcons.money,
                    color: ThemeColors.walletCardColor2,
                  ),
                ),
                ListTile(
                  title: const Text('Salary'),
                  subtitle: const Text('\$250.00'),
                  trailing: Icon(FluentIcons.chevron_right),
                  leading: Icon(
                    FluentIcons.money,
                    color: ThemeColors.walletCardColor1,
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
