import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/master_data.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';
import 'package:flutter_expense_tracker/expenses/widgets/image_input.dart';

class NewItemModal extends StatefulWidget {
  const NewItemModal({super.key});

  @override
  State<NewItemModal> createState() => _NewItemModalState();
}

class _NewItemModalState extends State<NewItemModal> {
  late List<ExpenseType> _expenseTypes;
  late List<Wallet> _wallets;
  late List<TransactionCategory> _transactionCategories;
  ExpenseType? _selectedExpenseType;
  Wallet? _selectedWallet;
  TransactionCategory? _selectedTransactionCategory;
  DateTime? _expenseDate;
  late TextEditingController _expenseAmount;
  late TextEditingController _description;
  String? _receiptImage;

  @override
  void initState() {
    super.initState();
    _expenseTypes = ExpenseType.getExpenseTypes();
    _wallets = Wallets.getWallets();
    _transactionCategories = TransactionCategory.getTransactionCategories();
    _expenseAmount = TextEditingController(text: '0.00');
    _description = TextEditingController();
  }

  @override
  void dispose() {
    _expenseAmount.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Acrylic(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.isPressed) {
                          return ThemeColors.gradientEdgeColor.withValues(
                            alpha: 0.7,
                          );
                        }
                        return ThemeColors.gradientEdgeColor;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
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
                      "Add New Transaction",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.02,
                    ),
                    child: ComboBox<ExpenseType>(
                      placeholder: const Text('Transaction Type'),
                      value: _selectedExpenseType,
                      items:
                          _expenseTypes.map<ComboBoxItem<ExpenseType>>((
                            expenseType,
                          ) {
                            return ComboBoxItem<ExpenseType>(
                              value: expenseType,
                              child: SizedBox(
                                width: screenWidth * 0.78,
                                child: Text(
                                  expenseType.description,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (exp) {
                        setState(() {
                          _selectedExpenseType = exp;
                          debugPrint(
                            'Selected Expense Type: ${_selectedExpenseType?.description}',
                          );
                        });
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.02,
                    ),
                    child: ComboBox<Wallet>(
                      placeholder: const Text('Wallet'),
                      value: _selectedWallet,
                      items:
                          _wallets.map<ComboBoxItem<Wallet>>((wallet) {
                            return ComboBoxItem<Wallet>(
                              value: wallet,
                              child: SizedBox(
                                width: screenWidth * 0.78,
                                child: Text(
                                  '${wallet.walletName} (\$${wallet.totalBalance})',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (w) {
                        setState(() {
                          _selectedWallet = w;
                          debugPrint(
                            'Selected Wallet: ${_selectedWallet?.walletName}',
                          );
                        });
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.02,
                    ),
                    child: ComboBox<TransactionCategory>(
                      placeholder: const Text('Transaction Category'),
                      value: _selectedTransactionCategory,
                      items:
                          _transactionCategories
                              .map<ComboBoxItem<TransactionCategory>>((
                                category,
                              ) {
                                return ComboBoxItem<TransactionCategory>(
                                  value: category,
                                  child: SizedBox(
                                    width: screenWidth * 0.78,
                                    child: Text(
                                      category.description,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                );
                              })
                              .toList(),
                      onChanged: (cat) {
                        setState(() {
                          _selectedTransactionCategory = cat;
                          debugPrint(
                            'Selected category: ${_selectedTransactionCategory?.description}',
                          );
                        });
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.1,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                    ),
                    // width: screenWidth * 0.8,
                    child: DatePicker(
                      header: 'Transaction Date',
                      selected: _expenseDate,
                      onChanged: (time) {
                        setState(() => _expenseDate = time);
                        debugPrint('Selected date: ${_expenseDate?.toLocal()}');
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.06,
                      right: screenWidth * 0.06,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                    ),
                    width: screenWidth * 0.8,
                    child: TextFormBox(
                      controller: _expenseAmount,
                      placeholder: 'Amount',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        final double? amount = double.tryParse(value);
                        if (amount == null || amount <= 0) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.06,
                      right: screenWidth * 0.06,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                    ),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.1,
                    child: TextFormBox(
                      scrollPadding: EdgeInsets.only(
                        bottom: screenHeight * 0.2,
                      ),
                      controller: _description,
                      placeholder: 'Description',
                      expands: true,
                      minLines: null,
                      maxLines: null,
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.only(
                  //     left: screenWidth * 0.06,
                  //     right: screenWidth * 0.06,
                  //     top: screenHeight * 0.02,
                  //     bottom: screenHeight * 0.02,
                  //   ),
                  //   width: screenWidth * 0.8,
                  //   child: Button(
                  //     child: const Text('↥ Upload Receipt'),
                  //     onPressed: () {
                  //       // select file from device

                  //       // upload file to server

                  //       setState(() {
                  //         _receiptImage =
                  //             '${DateTime.timestamp().millisecondsSinceEpoch}.jpeg';
                  //       });
                  //       debugPrint('Receipt uploaded: $_receiptImage');
                  //     },
                  //   ),
                  // ),
                  ImageInput(),

                  // show uploaded receipt file name
                  if (_receiptImage != null)
                    Container(
                      margin: EdgeInsets.only(
                        left: screenWidth * 0.11,
                        right: screenWidth * 0.11,
                        top: screenHeight * 0.02,
                        bottom: screenHeight * 0.02,
                      ),
                      width: screenWidth * 0.7,
                      child: Center(
                        child: Text(
                          'Uploaded Receipt: $_receiptImage',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.11,
                      right: screenWidth * 0.11,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                    ),
                    width: screenWidth * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            debugPrint('Delete button pressed');
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FluentIcons.recycle_bin,
                            size: screenWidth * 0.07,
                          ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return Color.fromARGB(
                                  255,
                                  255,
                                  108,
                                  108,
                                ).withValues(alpha: 0.5);
                              }
                              return Color.fromARGB(255, 255, 108, 108);
                            }),
                            foregroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return Colors.black.withValues(alpha: 0.7);
                              }
                              return Colors.black;
                            }),
                            padding: WidgetStateProperty.all(EdgeInsets.all(8)),
                            elevation: WidgetStateProperty.all(10),
                            shadowColor: WidgetStateProperty.all(
                              ThemeColors.gradientEdgeColor,
                            ),
                          ),
                        ),

                        Button(
                          onPressed: () {
                            debugPrint('Save button pressed');
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return ThemeColors.primaryColor.withValues(
                                  alpha: 0.5,
                                );
                              }
                              return ThemeColors.primaryColor;
                            }),
                            foregroundColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.isPressed) {
                                return Colors.black.withValues(alpha: 0.5);
                              }
                              return Colors.black;
                            }),
                            padding: WidgetStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.22,
                                vertical: 10,
                              ),
                            ),
                            elevation: WidgetStateProperty.all(10),
                            shadowColor: WidgetStateProperty.all(
                              ThemeColors.gradientEdgeColor,
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
