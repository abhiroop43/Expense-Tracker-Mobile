import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/expenses/widgets/transactions_list.dart';

class SearchModal extends StatefulWidget {
  const SearchModal({super.key});

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
  late TextEditingController _searchController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Acrylic(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Header container
          Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.02,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(FluentIcons.chevron_left),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.isPressed) {
                        return ThemeColors.gradientEdgeColor.withValues(
                          alpha: 0.7,
                        );
                      }
                      return ThemeColors.gradientEdgeColor;
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.isPressed) {
                        return Colors.white.withValues(alpha: 0.7);
                      }
                      return Colors.white;
                    }),
                    padding: WidgetStateProperty.all(EdgeInsets.all(15)),
                    elevation: WidgetStateProperty.all(10),
                    shadowColor: WidgetStateProperty.all(
                      ThemeColors.gradientEdgeColor,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search Field
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Center(
                    child: TextFormBox(
                      controller: _searchController,
                      placeholder: 'Salary....',
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          setState(() {
                            _formKey.currentState!.save();
                          });
                        } else if (value.isEmpty) {
                          setState(() {
                            _formKey.currentState!.save();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // filtered transactions list
          Flexible(
            child: TransactionsList(searchString: _searchController.text),
          ),
        ],
      ),
    );
  }
}
