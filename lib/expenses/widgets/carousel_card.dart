import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/common/curved_separator.dart';

class CarouselCard extends StatelessWidget {
  final double totalBalance;
  final double income;
  final double expense;
  final String walletName;

  const CarouselCard({
    super.key,
    required this.totalBalance,
    required this.income,
    required this.expense,
    required this.walletName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      backgroundColor: ThemeColors.walletCardColor1,
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: CustomPaint(
              size: Size(double.infinity, double.infinity),
              painter: CurvedSeparatorPainter(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total balance",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "\$$totalBalance",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(FluentIcons.more, size: 24.0),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        onPressed: () => debugPrint('pressed more'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 0),
                              CircleAvatar(
                                backgroundColor: ThemeColors.textBoxBorderColor,
                                radius: 10,
                                child: Icon(
                                  FluentIcons.down,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Income",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 2.0,
                            ),
                            child: Text(
                              "\$$income",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 0),
                              CircleAvatar(
                                backgroundColor: ThemeColors.textBoxBorderColor,
                                radius: 10,
                                child: Icon(
                                  FluentIcons.up,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Expense",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 2.0,
                            ),
                            child: Text(
                              "\$$expense",
                              style: TextStyle(color: Colors.red, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
