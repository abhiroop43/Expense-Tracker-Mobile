import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/recent_transactions.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transaction_item.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    var transactions = RecentTransactions.getRecentTransactions();
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: transactions.length, // entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: ThemeColors.elementBackgroundColor,
          child: TransactionItem(),
        );
      },
      separatorBuilder:
          (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(),
          ),
    );
  }
}
