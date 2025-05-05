import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/widgets/new_item.dart';
import 'package:flutter_expense_tracker/expenses/widgets/search.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transactions_list.dart';
import 'package:flutter_expense_tracker/expenses/widgets/wallet_carousel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _getTransactionListHeight(double screenHeight) {
    if (screenHeight < 650) return 160;
    if (screenHeight < 700) return 190;
    if (screenHeight < 750) return 250;
    if (screenHeight < 800) return 310;
    if (screenHeight < 850) return 350;
    if (screenHeight < 900) return 390;
    if (screenHeight < 950) return 430;
    return 440;
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 35, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              Text(
                "Abhiroop",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 10),
          child: IconButton(
            icon: const Icon(FluentIcons.search, size: 20.0),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.isPressed) {
                  return ThemeColors.elementBackgroundColor.withValues(
                    alpha: 0.7,
                  );
                }
                return ThemeColors.elementBackgroundColor;
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
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
                builder: (context) => SearchModal(),
                barrierDismissible: true,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double transactionListHeight = _getTransactionListHeight(screenHeight);
    const double kHeaderPaddingHorizontal = 8.0;
    const double kHeaderPaddingVertical = 8.0;

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
                  _buildHeader(context),
                  SizedBox(height: 25),
                  SizedBox(height: 180, child: WalletCarousel()),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHeaderPaddingHorizontal,
                      vertical: kHeaderPaddingVertical,
                    ),
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
                  builder: (context) => NewItemModal(),
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
