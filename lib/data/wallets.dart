class Wallet {
  final double totalBalance;
  final double income;
  final double expense;
  final String walletName;

  Wallet({
    required this.totalBalance,
    required this.income,
    required this.expense,
    required this.walletName,
  });
}

class Wallets {
  static getWallets() {
    return [
      Wallet(
        totalBalance: 484.00,
        income: 2379.00,
        expense: 1895.00,
        walletName: "Personal",
      ),
      Wallet(
        totalBalance: 1250.75,
        income: 3450.50,
        expense: 2199.75,
        walletName: "Savings",
      ),
      Wallet(
        totalBalance: 682.30,
        income: 1850.00,
        expense: 1167.70,
        walletName: "Travel",
      ),
      Wallet(
        totalBalance: 325.18,
        income: 1578.45,
        expense: 1253.27,
        walletName: "Business",
      ),
      Wallet(
        totalBalance: 2105.60,
        income: 4500.00,
        expense: 2394.40,
        walletName: "Investment",
      ),
      Wallet(
        totalBalance: 563.92,
        income: 1985.50,
        expense: 1421.58,
        walletName: "Emergency",
      ),
    ];
  }
}
