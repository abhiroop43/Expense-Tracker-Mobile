import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transaction_chart.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transactions_list.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 35),
          child: Text(
            'Statistics',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TransactionChart(),
        Flexible(child: TransactionsList()),
      ],
    );
  }
}
