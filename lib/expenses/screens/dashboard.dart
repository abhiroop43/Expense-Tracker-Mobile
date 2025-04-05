import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_expense_tracker/common/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 35, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello,"),
                            Text(
                              "Abhiroop",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 10),
                        child: IconButton(
                          icon: const Icon(FluentIcons.search, size: 20.0),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              ThemeColors.elementBackgroundColor,
                            ),
                          ),
                          onPressed: () {
                            debugPrint('pressed button');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text("This is the dashboard screen"),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.79,
            left: MediaQuery.of(context).size.width * 0.75,
            child: material.FloatingActionButton(
              onPressed: () {
                // Handle button press
              },
              child: Icon(FluentIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
