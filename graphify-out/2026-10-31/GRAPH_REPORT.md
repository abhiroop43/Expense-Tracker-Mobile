# Graph Report - flutter_expense_tracker  (2026-10-31)

## Corpus Check
- Large corpus: 197 files · ~1,002,758 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 630 nodes · 847 edges · 33 communities (23 shown, 10 thin omitted)
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 77 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Windows Runner (C++)
- Dashboard & Profile Screens
- Auth Form Widgets
- Apple Platform Runners
- CI, Config & Docs
- New Transaction Modal
- Wallet Editor & Painter
- Trends Chart
- Home Shell & Navigation
- Wallet Carousel & Items
- Linux Runner (GTK)
- Windows Native Includes
- Wallet Data Model
- App Bootstrap & Firebase
- Transaction Data Model
- Auth Screen & Screenshots
- Auth State & Google Sign-In
- Desktop CMake Build
- Password Reset
- Theme Colors
- Web Manifest
- Windows Plugin Registry
- Start Screen Flow
- Widget Test
- Onboarding Screenshot
- Android MainActivity
- Email Validation
- Expenses Root Widget

## God Nodes (most connected - your core abstractions)
1. `Win32Window` - 21 edges
2. `Registration Screen Screenshot` - 11 edges
3. `FlutterWindow` - 10 edges
4. `Login Screen Screenshot` - 10 edges
5. `Update Wallet Form` - 8 edges
6. `Home Screen Screenshot` - 8 edges
7. `Add New Transaction Form` - 8 edges
8. `WindowClassRegistrar` - 7 edges
9. `pubspec.yaml (flutter_expense_tracker)` - 7 edges
10. `_MyApplication` - 6 edges

## Surprising Connections (you probably didn't know these)
- `Custom Bottom Navigation Bar` --references--> `DashboardScreen`  [INFERRED]
  screenshots/home.png → lib/expenses/screens/dashboard.dart
- `Home Screen Screenshot` --references--> `HomeScreen`  [INFERRED]
  screenshots/home.png → lib/expenses/screens/home.dart
- `Profile Screen` --implements--> `ProfilesScreen`  [INFERRED]
  screenshots/profile.png → lib/expenses/screens/profiles.dart
- `Statistics Screen Screenshot` --references--> `TrendsScreen`  [INFERRED]
  screenshots/statistics.png → lib/expenses/screens/trends.dart
- `Wallets Screen (My Wallets)` --implements--> `WalletsScreen`  [INFERRED]
  screenshots/wallets.png → lib/expenses/screens/wallets.dart

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **CI Android release pipeline** — _github_workflows_build_google_services_secret, _github_workflows_build_android_signing, _github_workflows_build_build_apk_appbundle, _github_workflows_build_version_tag_release, pubspec_version [EXTRACTED 1.00]
- **Splash screen branding (#121528 + logo)** — flutter_native_splash, web_index_splash_screen, pubspec_flutter_native_splash, pubspec_assets [INFERRED 0.85]
- **Flutter desktop native CMake build pipeline (Linux & Windows)** — linux_cmakelists, linux_flutter_cmakelists, linux_runner_cmakelists, windows_cmakelists, windows_flutter_cmakelists, windows_runner_cmakelists [INFERRED 0.85]
- **Wallet Create/Update/Delete Flow** — screenshots_wallets_wallets_screen, screenshots_wallets_add_wallet_button, screenshots_add_edit_wallet_update_wallet_form, screenshots_add_edit_wallet_update_button, screenshots_add_edit_wallet_delete_wallet_button [INFERRED 0.85]
- **Income vs Expense Visualization** — screenshots_home_wallet_card_stack, screenshots_statistics_income_expense_bar_chart, screenshots_home_transaction_item, screenshots_home_dark_theme_lime_accent [INFERRED 0.75]
- **Icon-Prefixed Text Box Inputs** — screenshots_login_email_field, screenshots_login_password_field, screenshots_registration_name_field, screenshots_registration_email_field, screenshots_registration_password_field, screenshots_registration_confirm_password_field [INFERRED 0.85]
- **Add Transaction Flow** — screenshots_home_add_transaction_fab, screenshots_new_transaction_add_new_transaction_form, screenshots_new_transaction_select_receipt, screenshots_home_recent_transactions_list [INFERRED 0.75]
- **Onboarding to Auth Navigation Flow** — screenshots_start, screenshots_login, screenshots_registration [INFERRED 0.95]
- **Lime Green Full-Width Primary CTAs** — screenshots_start_get_started_button, screenshots_login_login_button, screenshots_registration_sign_up_button, screenshots_start_dark_theme_lime_accent [INFERRED 0.85]
- **Bottom Navigation Tab Screens** — screenshots_home_bottom_navigation_bar, screenshots_home, screenshots_statistics, lib_expenses_screens_dashboard_dashboardscreen [INFERRED 0.75]
- **Bottom Navigation Tab Screens** — screenshots_wallets_bottom_navigation_bar, screenshots_wallets_wallets_screen, screenshots_profile_profile_screen, lib_expenses_screens_home_homescreen [INFERRED 0.75]

## Communities (33 total, 10 thin omitted)

### Community 0 - "Windows Runner (C++)"
Cohesion: 0.05
Nodes (20): FlutterWindow, flutter_controller_, FlutterWindow::FlutterWindow(), project_, EnableFullDpiSupportIfAvailable(), Point, x, y (+12 more)

### Community 1 - "Dashboard & Profile Screens"
Cohesion: 0.05
Nodes (35): build, _buildHeader, createState, DashboardScreen, _DashboardScreenState, build, createState, ProfilesScreen (+27 more)

### Community 2 - "Auth Form Widgets"
Cohesion: 0.05
Nodes (27): build, formKey, icon, isPassword, keyboardType, placeholder, textEditingController, validator (+19 more)

### Community 3 - "Apple Platform Runners"
Cohesion: 0.07
Nodes (16): Cocoa, file_selector_macos, firebase_auth, firebase_core, Flutter, FlutterMacOS, Foundation, google_sign_in_ios (+8 more)

### Community 4 - "CI, Config & Docs"
Cohesion: 0.07
Nodes (31): Flutter CI Workflow (build.yml), Android keystore & key.properties signing setup, Build release APK and AppBundle, flutter_job (ubuntu-latest), google-services.json from GOOGLE_SERVICES_JSON secret, Version extraction, tag check and GitHub release, Dart analyzer config (flutter_lints, excludes platform dirs), Firebase CLI firepit log (ShellJSInternalError chmod shell.bat) (+23 more)

### Community 5 - "New Transaction Modal"
Cohesion: 0.07
Nodes (23): code, description, ExpenseType, getExpenseTypes, getTransactionCategories, id, TransactionCategory, build (+15 more)

### Community 6 - "Wallet Editor & Painter"
Cohesion: 0.07
Nodes (23): CurvedSeparatorPainter, paint, shouldRepaint, AddEditWallet, _AddEditWalletState, build, createState, _delete (+15 more)

### Community 7 - "Trends Chart"
Cohesion: 0.07
Nodes (26): avgColor, barMaxHeight, bottomChartTitles, bottomTitles, bottomYearTitles, build, count, createState (+18 more)

### Community 8 - "Home Shell & Navigation"
Cohesion: 0.07
Nodes (24): build, _buildNavItem, _changeIndex, createState, _currentPageIndex, HomeScreen, _HomeScreenState, build (+16 more)

### Community 9 - "Wallet Carousel & Items"
Cohesion: 0.08
Nodes (26): build, CarouselCard, expense, income, totalBalance, walletName, TransactionItemIcon, TransactionItem (+18 more)

### Community 10 - "Linux Runner (GTK)"
Cohesion: 0.09
Nodes (13): fl_register_plugins(), main(), my_application_activate(), my_application_class_init(), my_application_dispose(), my_application_init(), my_application_local_command_line(), my_application_new() (+5 more)

### Community 11 - "Windows Native Includes"
Cohesion: 0.12
Nodes (4): wWinMain(), CreateAndAttachConsole(), GetCommandLineArguments(), Utf8FromUtf16()

### Community 12 - "Wallet Data Model"
Cohesion: 0.09
Nodes (21): addWallet, deleteWallet, expense, getWallets, id, income, totalBalance, updateWallet (+13 more)

### Community 13 - "App Bootstrap & Firebase"
Cohesion: 0.09
Nodes (9): build, buttonType, screenWidth, android, DefaultFirebaseOptions, ios, build, initializeApp (+1 more)

### Community 14 - "Transaction Data Model"
Cohesion: 0.10
Nodes (16): addTransaction, amount, description, getRecentTransactions, id, receiptImage, RecentTransactions, searchTransactions (+8 more)

### Community 15 - "Auth Screen & Screenshots"
Cohesion: 0.15
Nodes (17): AuthScreen, _AuthScreenState, TextBoxWithIcon, Login Screen Screenshot, Email Field with @ Icon, Login Button, Password Field with Dots Icon, Don't have an account? Sign up Toggle (+9 more)

### Community 16 - "Auth State & Google Sign-In"
Cohesion: 0.12
Nodes (10): _confirmPasswordController, createState, dispose, _emailController, _formKey, _googleSignIn, isLogin, _nameController (+2 more)

### Community 17 - "Desktop CMake Build"
Cohesion: 0.21
Nodes (14): Linux top-level CMake (BINARY_NAME flutter_expense_tracker, APPLICATION_ID dev.abhiroopsantra.flutter_expense_tracker), APPLY_STANDARD_SETTINGS (Linux, C++14, -Wall -Werror), Linux relocatable bundle install, Linux Flutter library build (libflutter_linux_gtk.so), flutter_assemble target (Linux, tool_backend.sh), Linux runner executable (main.cc, my_application.cc), Windows top-level CMake (flutter_expense_tracker), APPLY_STANDARD_SETTINGS (Windows, C++17, /W4 /WX) (+6 more)

### Community 18 - "Password Reset"
Cohesion: 0.18
Nodes (9): build, createState, dispose, _emailController, _formKey, PasswordResetScreen, _PasswordResetScreenState, _submitForm (+1 more)

### Community 19 - "Theme Colors"
Cohesion: 0.17
Nodes (9): backgroundColor, elementBackgroundColor, gradientEdgeColor, primaryColor, textBoxBorderColor, ThemeColors, walletCardColor1, walletCardColor2 (+1 more)

### Community 20 - "Web Manifest"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 22 - "Start Screen Flow"
Cohesion: 0.25
Nodes (4): build, _submitForm, build, StartScreen

### Community 24 - "Onboarding Screenshot"
Cohesion: 0.40
Nodes (5): Start Screen Screenshot, Tagline: Always take control of your finances, Get Started Button, Onboarding Hero Illustration (piggy bank, coins, calendar), Sign in Link (top right)

## Knowledge Gaps
- **234 isolated node(s):** `isLogin`, `_formKey`, `_nameController`, `_emailController`, `_passwordController` (+229 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 350 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **10 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Wallet` connect `Wallet Data Model` to `New Transaction Modal`, `Wallet Editor & Painter`?**
  _High betweenness centrality (0.034) - this node is a cross-community bridge._
- **What connects `isLogin`, `_formKey`, `_nameController` to the rest of the system?**
  _234 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Windows Runner (C++)` be split into smaller, more focused modules?**
  _Cohesion score 0.05384615384615385 - nodes in this community are weakly interconnected._
- **Why does `AuthScreen` connect `Auth Screen & Screenshots` to `Auth State & Google Sign-In`, `Dashboard & Profile Screens`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **Should `Dashboard & Profile Screens` be split into smaller, more focused modules?**
  _Cohesion score 0.05224963715529753 - nodes in this community are weakly interconnected._
- **Why does `NewItemModal` connect `New Transaction Modal` to `Dashboard & Profile Screens`, `Wallet Carousel & Items`?**
  _High betweenness centrality (0.015) - this node is a cross-community bridge._
- **Should `Auth Form Widgets` be split into smaller, more focused modules?**
  _Cohesion score 0.05384615384615385 - nodes in this community are weakly interconnected._