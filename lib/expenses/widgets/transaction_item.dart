import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/recent_transactions.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transaction_item_icon.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    const List<String> kMonths = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TransactionItemIcon(transactionType: transaction.transactionCategory),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction.transactionCategory,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  transaction.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: ThemeColors.walletCardColor2,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(width: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("- \$25"),
              Text(
                style: TextStyle(
                  color: ThemeColors.walletCardColor2,
                  fontSize: 12,
                ),
                "${transaction.transactionDate.day} ${kMonths[transaction.transactionDate.month - 1]} ${transaction.transactionDate.year.toString().substring(2)}",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
