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

  Widget _buildNavItem(
    IconData icon,
    int index,
    double size,
    double topPad,
    double bottomPad,
  ) {
    final bool selected = _currentPageIndex == index;
    final Color color =
        selected ? Colors.white : Colors.white.withValues(alpha: 0.7);
    return GestureDetector(
      onTap: () => _changeIndex(index),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, topPad, 0, bottomPad),
        child: Icon(icon, size: size, color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = 15.0;
    final double bottomPadding = 35.0;
    // final double horizontalPadding = 5.0;
    final double iconSize = 25;
    return ScaffoldPage(
      resizeToAvoidBottomInset: false,
      bottomBar: Container(
        color: ThemeColors.elementBackgroundColor,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                FluentIcons.home,
                0,
                iconSize,
                topPadding,
                bottomPadding,
              ),
              _buildNavItem(
                FluentIcons.p_b_i_column,
                1,
                iconSize,
                topPadding,
                bottomPadding,
              ),
              _buildNavItem(
                FluentIcons.payment_card,
                2,
                iconSize,
                topPadding,
                bottomPadding,
              ),
              _buildNavItem(
                FluentIcons.contact,
                3,
                iconSize,
                topPadding,
                bottomPadding,
              ),
            ],
          ),
        ),
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
