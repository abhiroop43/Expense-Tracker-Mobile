import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';

class AddEditWallet extends StatefulWidget {
  final Wallet? wallet;
  const AddEditWallet({super.key, this.wallet});

  @override
  State<AddEditWallet> createState() => _AddEditWalletState();
}

class _AddEditWalletState extends State<AddEditWallet> {
  late TextEditingController _walletNameController;

  @override
  void initState() {
    super.initState();
    _walletNameController = TextEditingController(
      text: widget.wallet?.walletName ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Acrylic(
      child: Column(
        children: [
          Row(
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
                child: Text(
                  textAlign: TextAlign.center,
                  widget.wallet != null ? "Update Wallet" : "Add Wallet",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Form(
            child: Expanded(
              child: Column(
                children: [
                  TextFormBox(controller: _walletNameController),
                  const SizedBox(height: 16),
                  TextFormBox(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FluentIcons.recycle_bin, size: screenWidth * 0.07),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.isPressed) {
                      return Colors.red.withValues(alpha: 0.7);
                    }
                    return Colors.red;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.isPressed) {
                      return Colors.white.withValues(alpha: 0.7);
                    }
                    return Colors.white;
                  }),
                  padding: WidgetStateProperty.all(EdgeInsets.all(8)),
                  elevation: WidgetStateProperty.all(10),
                  shadowColor: WidgetStateProperty.all(
                    ThemeColors.gradientEdgeColor,
                  ),
                ),
              ),
              Button(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.isPressed) {
                      return ThemeColors.primaryColor.withValues(alpha: 0.7);
                    }
                    return ThemeColors.primaryColor;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.isPressed) {
                      return Colors.black.withValues(alpha: 0.7);
                    }
                    return Colors.black;
                  }),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.3,
                      vertical: 10,
                    ),
                  ),
                  elevation: WidgetStateProperty.all(10),
                  shadowColor: WidgetStateProperty.all(
                    ThemeColors.gradientEdgeColor,
                  ),
                ),
                child: Text(
                  widget.wallet != null ? "Update" : "Save",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
