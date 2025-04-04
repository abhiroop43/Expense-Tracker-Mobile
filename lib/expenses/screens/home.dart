import 'package:fluent_ui/fluent_ui.dart';
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
    return ScaffoldPage(
      bottomBar: BottomNavigation(
        items: [
          BottomNavigationItem(
            icon: Icon(FluentIcons.home, color: Colors.white),
            selectedIcon: Icon(FluentIcons.home),
          ),
          BottomNavigationItem(
            icon: Icon(FluentIcons.p_b_i_column, color: Colors.white),
            selectedIcon: Icon(FluentIcons.p_b_i_column),
          ),
          BottomNavigationItem(
            icon: Icon(FluentIcons.payment_card, color: Colors.white),
            selectedIcon: Icon(FluentIcons.payment_card),
          ),
          BottomNavigationItem(
            icon: Icon(FluentIcons.contact, color: Colors.white),
            selectedIcon: Icon(FluentIcons.contact),
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
