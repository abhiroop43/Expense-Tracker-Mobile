import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/recent_transactions.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transaction_item.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var transactions = RecentTransactions.getRecentTransactions();
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          color: ThemeColors.elementBackgroundColor,
          child: TransactionItem(transaction: transactions[index]),
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
