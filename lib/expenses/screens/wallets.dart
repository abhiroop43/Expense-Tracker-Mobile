import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';
import 'package:flutter_expense_tracker/expenses/widgets/add_edit_wallet.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  late List<Wallet> wallets = [];

  @override
  void initState() {
    super.initState();
    wallets = Wallets.getWallets();
  }

  @override
  Widget build(BuildContext context) {
    // screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.1),
          child: Text(
            textAlign: TextAlign.center,
            '\$484.00',
            style: TextStyle(
              fontSize: screenHeight * 0.055,
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
              fontSize: screenHeight * 0.015,
              fontWeight: FontWeight.w200,
              color: ThemeColors.walletCardColor1,
            ),
          ),
        ),
        Expanded(
          child: Card(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenHeight * 0.03),
              topRight: Radius.circular(screenHeight * 0.03),
            ),
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            backgroundColor: Color.fromARGB(255, 40, 37, 37),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.025,
                    left: screenWidth * 0.035,
                    right: screenWidth * 0.035,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'My Wallets',
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith((
                            states,
                          ) {
                            if (states.isPressed) {
                              return ThemeColors.primaryColor.withValues(
                                alpha: 0.7,
                              );
                            }
                            return ThemeColors.primaryColor;
                          }),
                          foregroundColor: WidgetStateProperty.resolveWith((
                            states,
                          ) {
                            if (states.isPressed) {
                              return Colors.black.withValues(alpha: 0.7);
                            }
                            return Colors.black;
                          }),
                          padding: WidgetStateProperty.all(EdgeInsets.all(8)),
                          elevation: WidgetStateProperty.all(10),
                          shadowColor: WidgetStateProperty.all(
                            ThemeColors.gradientEdgeColor,
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddEditWallet(),
                            barrierDismissible: true,
                          );
                        },
                        icon: Icon(FluentIcons.add, size: screenHeight * 0.02),
                        iconButtonMode: IconButtonMode.small,
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                    left: screenWidth * 0.01,
                    right: screenWidth * 0.01,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: wallets.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(wallets[index].walletName),
                      subtitle: Text('\$${wallets[index].totalBalance}'),
                      trailing: Icon(FluentIcons.chevron_right),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          wallets[index].walletImage,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
