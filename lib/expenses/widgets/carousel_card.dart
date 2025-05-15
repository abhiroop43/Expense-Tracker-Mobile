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
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Card(
      backgroundColor: ThemeColors.walletCardColor1,
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.002,
        horizontal: screenWidth * 0.001,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: CustomPaint(
              size: Size(screenHeight, screenWidth),
              painter: CurvedSeparatorPainter(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.03,
              right: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.02,
            ),
            child: SingleChildScrollView(
              // Makes the content scrollable
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            walletName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * 0.02,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "\$$totalBalance",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          FluentIcons.more,
                          size: screenHeight * 0.025,
                        ),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        onPressed: () => debugPrint('pressed more'),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ThemeColors.textBoxBorderColor,
                                radius: 10,
                                child: Icon(
                                  FluentIcons.down,
                                  color: Colors.black,
                                  size: screenHeight * 0.012,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Income",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              textAlign: TextAlign.right,
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
                              CircleAvatar(
                                backgroundColor: ThemeColors.textBoxBorderColor,
                                radius: 10,
                                child: Icon(
                                  FluentIcons.up,
                                  color: Colors.black,
                                  size: screenHeight * 0.012,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Expense",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              textAlign: TextAlign.right,
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
