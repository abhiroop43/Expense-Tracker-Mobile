class Wallet {
  final int id;
  final double totalBalance;
  final double income;
  final double expense;
  final String walletName;
  final String walletImage;

  Wallet({
    required this.id,
    required this.totalBalance,
    required this.income,
    required this.expense,
    required this.walletName,
    required this.walletImage,
  });
}

class Wallets {
  static getWallets() {
    return [
      Wallet(
        id: 1,
        totalBalance: 484.00,
        income: 2379.00,
        expense: 1895.00,
        walletName: "Personal",
        walletImage:
            "https://media.istockphoto.com/id/1007511594/vector/savings-flat-design-insurance-icon.jpg?s=612x612&w=0&k=20&c=MnyEFaMzbjA1mN8u4_8k9ZF6WZqr3m-jQ02OGhYb0rA=",
      ),
      Wallet(
        id: 2,
        totalBalance: 1250.75,
        income: 3450.50,
        expense: 2199.75,
        walletName: "Savings",
        walletImage:
            "https://img.freepik.com/free-vector/money-gold-coin-jar-saving-cartoon-vector-icon-illustration-finance-object-isolated-flat-vector_138676-11039.jpg?semt=ais_hybrid&w=740",
      ),
      Wallet(
        id: 3,
        totalBalance: 682.30,
        income: 1850.00,
        expense: 1167.70,
        walletName: "Travel",
        walletImage: "https://cdn-icons-png.flaticon.com/512/6556/6556174.png",
      ),
      Wallet(
        id: 4,
        totalBalance: 325.18,
        income: 1578.45,
        expense: 1253.27,
        walletName: "Business",
        walletImage: "https://cdn-icons-png.flaticon.com/512/4862/4862177.png",
      ),
      Wallet(
        id: 5,
        totalBalance: 2105.60,
        income: 4500.00,
        expense: 2394.40,
        walletName: "Investment",
        walletImage: "https://cdn-icons-png.flaticon.com/512/7298/7298287.png",
      ),
      Wallet(
        id: 6,
        totalBalance: 563.92,
        income: 1985.50,
        expense: 1421.58,
        walletName: "Emergency",
        walletImage: "https://www.landmarkhealth.org/wp-content/uploads/2023/11/piggybank.png",
      ),
    ];
  }
}
