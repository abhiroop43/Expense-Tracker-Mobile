import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';
import 'package:image_picker/image_picker.dart';

class AddEditWallet extends StatefulWidget {
  final Wallet? wallet;
  const AddEditWallet({super.key, this.wallet});

  @override
  State<AddEditWallet> createState() => _AddEditWalletState();
}

class _AddEditWalletState extends State<AddEditWallet> {
  late TextEditingController _walletNameController;
  File? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _walletNameController = TextEditingController(
      text: widget.wallet?.walletName ?? '',
    );
  }

  Future _pickIconFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedIcon = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_walletNameController.text.isEmpty) {
      // Show error message
      return;
    }
    if (_selectedIcon == null) {
      // Show error message
      return;
    }
    // Save the wallet
    Navigator.pop(context);
  }

  void _delete() async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder:
          (context) => ContentDialog(
            title: const Text('Delete wallet permanently?'),
            content: const Text(
              'Warning: You will lose all related data. Do you want to delete it?',
            ),
            actions: [
              Button(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );

    if (result != true) return;

    // call API to delete the wallet
    if (mounted) {
      // show infobar
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Acrylic(
      child: Column(
        children: [
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
          ),
          // const SizedBox(height: 16),
          Form(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.02,
                    ),
                    child: TextFormBox(controller: _walletNameController),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Row(
                      spacing: screenWidth * 0.1,
                      children: [
                        _selectedIcon != null
                            ? Image.file(
                              _selectedIcon!,
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.2,
                            )
                            : Icon(FluentIcons.file_image, size: 50),
                        Button(
                          child: const Text('Select Icon'),
                          onPressed: () {
                            _pickIconFromGallery();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _delete();
                  },
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
                  onPressed: () {
                    _submit();
                  },
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
          ),
        ],
      ),
    );
  }
}
