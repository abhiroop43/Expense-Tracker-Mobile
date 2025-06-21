import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import "package:collection/collection.dart";
import 'package:flutter_expense_tracker/data/recent_transactions.dart';

class TransactionChart extends StatefulWidget {
  TransactionChart({super.key});

  final Color leftBarColor = ThemeColors.primaryColor;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.yellow;

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  List<String> bottomChartTitles = ['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
  List<String> bottomYearTitles = [];

  int touchedGroupIndex = -1;
  bool weeklyChecked = true;
  bool monthlyChecked = false;
  bool yearlyChecked = false;
  double maxIncome = 0.0;
  double maxExpense = 0.0;

  double barMaxHeight = 0.0;

  int count = 7;
  int transactionYears = 0;

  @override
  void initState() {
    super.initState();

    _setBarChartData();

    weeklyChecked = true;
    monthlyChecked = false;
    yearlyChecked = false;
  }

  void _setBarChartData() {
    var transactions = RecentTransactions().getRecentTransactions();

    if (transactions.isEmpty) {
      return;
    }

    transactionYears = 0; // reset transaction years count
    maxIncome = 0.0; // reset max. income
    maxExpense = 0.0; // reset max. expense

    List<BarChartGroupData> items = [];

    if (weeklyChecked) {
      bottomChartTitles = ['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
      count = 7;

      var weeklyTransactions = groupBy(
        transactions,
        (Transaction trn) => trn.transactionDate.weekday,
      );

      for (int i = 1; i <= count; i++) {
        double income =
            weeklyTransactions[i]
                ?.where((trn) => trn.transactionType == 'Income')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;
        double expense =
            weeklyTransactions[i]
                ?.where((trn) => trn.transactionType == 'Expense')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;

        if (income > maxIncome) {
          maxIncome = income;
        }
        if (expense > maxExpense) {
          maxExpense = expense;
        }

        items.add(makeGroupData(i - 1, income, expense));
      }
    } else if (monthlyChecked) {
      bottomChartTitles = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      count = 12;

      var monthlyTransactions = groupBy(
        transactions,
        (Transaction trn) => trn.transactionDate.month,
      );

      for (int i = 1; i <= count; i++) {
        double income =
            monthlyTransactions[i]
                ?.where((trn) => trn.transactionType == 'Income')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;

        double expense =
            monthlyTransactions[i]
                ?.where((trn) => trn.transactionType == 'Expense')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;

        if (income > maxIncome) {
          maxIncome = income;
        }
        if (expense > maxExpense) {
          maxExpense = expense;
        }

        items.add(makeGroupData(i - 1, income, expense));
      }
    } else {
      // yearly checked
      groupBy(
        transactions,
        (Transaction trn) => trn.transactionDate.year,
      ).forEach((key, value) {
        bottomYearTitles.add(key.toString());
        transactionYears++;
      });

      bottomChartTitles = bottomYearTitles;
      count = transactionYears;

      var yearlyTransactions = groupBy(
        transactions,
        (Transaction trn) => trn.transactionDate.year,
      );

      for (int i = 1; i <= count; i++) {
        double income =
            yearlyTransactions[int.parse(bottomYearTitles[i - 1])]
                ?.where((trn) => trn.transactionType == 'Income')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;
        double expense =
            yearlyTransactions[int.parse(bottomYearTitles[i - 1])]
                ?.where((trn) => trn.transactionType == 'Expense')
                .fold(0.0, (sum, trn) => sum! + trn.amount) ??
            0.0;

        if (income > maxIncome) {
          maxIncome = income;
        }
        if (expense > maxExpense) {
          maxExpense = expense;
        }

        items.add(makeGroupData(i - 1, income, expense));
      }
    }

    barMaxHeight = max(maxIncome, maxExpense);

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
    debugPrint("Transaction years: $transactionYears");
    debugPrint('Setting data....');
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ToggleButton(
                    checked: weeklyChecked,
                    onChanged:
                        (v) => setState(() {
                          weeklyChecked = true;
                          monthlyChecked = false;
                          yearlyChecked = false;
                          _setBarChartData();
                        }),
                    child: const Text('Weekly'),
                  ),
                ),
                Expanded(
                  child: ToggleButton(
                    checked: monthlyChecked,
                    onChanged:
                        (v) => setState(() {
                          weeklyChecked = false;
                          monthlyChecked = true;
                          yearlyChecked = false;
                          _setBarChartData();
                        }),
                    child: const Text('Monthly'),
                  ),
                ),
                Expanded(
                  child: ToggleButton(
                    checked: yearlyChecked,
                    onChanged:
                        (v) => setState(() {
                          weeklyChecked = false;
                          monthlyChecked = false;
                          yearlyChecked = true;
                          _setBarChartData();
                        }),
                    child: const Text('Yearly'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 38),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: barMaxHeight,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) {
                        return Colors.grey;
                      }),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg =
                              sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                                barRods:
                                    showingBarGroups[touchedGroupIndex].barRods
                                        .map((rod) {
                                          return rod.copyWith(
                                            toY: avg,
                                            color: widget.avgColor,
                                          );
                                        })
                                        .toList(),
                              );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == barMaxHeight / 2) {
      text =
          barMaxHeight < 1000
              ? (barMaxHeight / 2).toStringAsFixed(0)
              : '${(barMaxHeight / 2 / 1000).toStringAsFixed(0)}K';
    } else if (value == barMaxHeight) {
      text =
          barMaxHeight < 1000
              ? barMaxHeight.toStringAsFixed(0)
              : '${(barMaxHeight / 1000).toStringAsFixed(0)}K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = bottomChartTitles;

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: widget.leftBarColor, width: width),
        BarChartRodData(toY: y2, color: widget.rightBarColor, width: width),
      ],
    );
  }
}
