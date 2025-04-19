import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transactions_list.dart';
import 'package:flutter_expense_tracker/expenses/widgets/wallet_carousel.dart';
import 'package:flutter_expense_tracker/expenses/widgets/new_item.dart';
import 'package:flutter_expense_tracker/expenses/widgets/search.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double transactionListHeight;

    if (pixelRatio <= 2.0) {
      transactionListHeight = 165;
    } else if (pixelRatio > 2.0 && pixelRatio < 2.5) {
      transactionListHeight = 320;
    } else if (pixelRatio >= 2.5 && pixelRatio < 3.0) {
      transactionListHeight = 430;
    } else {
      transactionListHeight = 500;
    }

    debugPrint("devicePixelRatio: ${MediaQuery.of(context).devicePixelRatio}");
    debugPrint("Height: ${MediaQuery.of(context).size.height}");
    debugPrint("Width: ${MediaQuery.of(context).size.width}");

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 35, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello,"),
                            Text(
                              "Abhiroop",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 10),
                        child: IconButton(
                          icon: const Icon(FluentIcons.search, size: 20.0),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return ThemeColors.elementBackgroundColor
                                    .withValues(alpha: 0.7);
                              }
                              return ThemeColors.elementBackgroundColor;
                            }),
                            foregroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return Colors.white.withValues(alpha: 0.7);
                              }
                              return Colors.white;
                            }),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => NewItemModal(),
                              barrierDismissible: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  SizedBox(height: 180, child: WalletCarousel()),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: transactionListHeight,
                    child: TransactionsList(),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.78,
            left: MediaQuery.of(context).size.width * 0.78,
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.isPressed) {
                    return ThemeColors.primaryColor.withValues(alpha: 0.7);
                  }
                  return ThemeColors.primaryColor;
                }),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.isPressed) {
                    return Colors.black.withValues(alpha: 0.7);
                  }
                  return Colors.black;
                }),
                padding: WidgetStateProperty.all(EdgeInsets.all(15)),
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
                  builder: (context) => SearchModal(),
                  barrierDismissible: true,
                );
              },
              icon: Icon(FluentIcons.add, size: 24),
              iconButtonMode: IconButtonMode.large,
            ),
          ),
        ],
      ),
    );
  }
}
