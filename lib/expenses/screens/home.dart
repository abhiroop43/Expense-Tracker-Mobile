import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/screens/dashboard.dart';
import 'package:flutter_expense_tracker/expenses/screens/profiles.dart';
import 'package:flutter_expense_tracker/expenses/screens/trends.dart';
import 'package:flutter_expense_tracker/expenses/screens/wallets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = 15.0;
    final double bottomPadding = 35.0;
    // final double horizontalPadding = 5.0;
    final double iconSize = 25;
    return ScaffoldPage(
      resizeToAvoidBottomInset: false,
      bottomBar: BottomNavigation(
        style: BottomNavigationThemeData(
          inactiveColor: Colors.white,
          backgroundColor: ThemeColors.elementBackgroundColor,
        ),
        items: [
          BottomNavigationItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.home, size: iconSize),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.home, size: iconSize),
            ),
          ),

          BottomNavigationItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.p_b_i_column, size: iconSize),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.p_b_i_column, size: iconSize),
            ),
          ),

          BottomNavigationItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.payment_card, size: iconSize),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.payment_card, size: iconSize),
            ),
          ),

          BottomNavigationItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.contact, size: iconSize),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              child: Icon(FluentIcons.contact, size: iconSize),
            ),
          ),
        ],
        index: _currentPageIndex,
        onChanged: _changeIndex,
      ),
      content:
          <Widget>[
            DashboardScreen(),
            TrendsScreen(),
            WalletsScreen(),
            ProfilesScreen(),
          ][_currentPageIndex],
    );
  }
}
