import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/recent_transactions.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transaction_item.dart';

class TransactionsList extends StatefulWidget {
  final String searchString;
  const TransactionsList({super.key, this.searchString = ""});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final ScrollController _scrollController = ScrollController();
  final List<Transaction> _transactions = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  void loadTransactions() {
    var loadedTransactions = RecentTransactions().searchTransactions(
      widget.searchString,
    );

    var future = Future(() {});

    for (var i = 0; i < loadedTransactions.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _transactions.add(loadedTransactions[i]);
          _listKey.currentState?.insertItem(_transactions.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList.separated(
      key: _listKey,
      padding: const EdgeInsets.all(8),
      initialItemCount: _transactions.length,
      separatorBuilder:
          (BuildContext context, int index, Animation<double> animation) =>
              SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(),
                ),
              ),
      removedSeparatorBuilder:
          (context, index, animation) => SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(),
            ),
          ),
      itemBuilder: (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive((Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)))),
          child: Container(
            height: 70,
            color: ThemeColors.elementBackgroundColor,
            child: TransactionItem(transaction: _transactions[index]),
          ),
        );
      },
    );
  }
}
