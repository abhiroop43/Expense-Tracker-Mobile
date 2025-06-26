import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/widgets/new_item_modal.dart';
import 'package:flutter_expense_tracker/expenses/widgets/search.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transactions_list.dart';
import 'package:flutter_expense_tracker/expenses/widgets/wallet_carousel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
          padding: const EdgeInsets.only(right: 10),
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
    var screenWidth = MediaQuery.of(context).size.width;

    double gap = screenHeight * 0.04;
    double carouselHeight = screenHeight * 0.22;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              SizedBox(height: gap),
              SizedBox(height: carouselHeight, child: WalletCarousel()),
              SizedBox(height: gap),
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.009),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              // SizedBox(
              //   height: transactionListHeight,
              //   child: TransactionsList(),
              // ),
              Expanded(child: TransactionsList()),
            ],
          ),
          Positioned(
            top: screenHeight * 0.74,
            left: screenWidth * 0.77,
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
              icon: Icon(FluentIcons.add, size: screenHeight * 0.03),
              iconButtonMode: IconButtonMode.large,
            ),
          ),
        ],
      ),
    );
  }
}
