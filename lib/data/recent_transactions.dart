class Transaction {
  final int id;
  final String transactionType;
  final int walletId;
  final String transactionCategory;
  final DateTime transactionDate;
  final double amount;
  final String description;
  final String receiptImage;

  Transaction({
    required this.id,
    required this.transactionType,
    required this.walletId,
    required this.transactionCategory,
    required this.transactionDate,
    required this.amount,
    this.description = "",
    required this.receiptImage,
  });
}

class RecentTransactions {
  static List<Transaction> getRecentTransactions() {
    return [
      // 2023 Transactions
      Transaction(
        id: 1,
        transactionType: "Expense",
        walletId: 1,
        transactionCategory: "Health",
        transactionDate: DateTime(2023, 2, 15),
        amount: 125.50,
        description: "Annual medical checkup",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 2,
        transactionType: "Income",
        walletId: 2,
        transactionCategory: "Savings",
        transactionDate: DateTime(2023, 3, 5),
        amount: 1500.00,
        description: "Tax refund",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 3,
        transactionType: "Expense",
        walletId: 3,
        transactionCategory: "Clothing",
        transactionDate: DateTime(2023, 7, 20),
        amount: 89.99,
        description: "New summer clothes",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 4,
        transactionType: "Expense",
        walletId: 4,
        transactionCategory: "Others",
        transactionDate: DateTime(2023, 10, 10),
        amount: 450.75,
        description: "Flight tickets",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),

      // 2024 Transactions
      Transaction(
        id: 5,
        transactionType: "Income",
        walletId: 5,
        transactionCategory: "Others",
        transactionDate: DateTime(2024, 1, 15),
        amount: 320.50,
        description: "Dividends payment",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 6,
        transactionType: "Expense",
        walletId: 6,
        transactionCategory: "Personal",
        transactionDate: DateTime(2024, 2, 12),
        amount: 210.25,
        description: "Birthday gifts",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 7,
        transactionType: "Income",
        walletId: 1,
        transactionCategory: "Personal",
        transactionDate: DateTime(2024, 3, 5),
        amount: 1200.00,
        description: "Freelance project payment",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 8,
        transactionType: "Expense",
        walletId: 2,
        transactionCategory: "Insurance",
        transactionDate: DateTime(2024, 4, 15),
        amount: 145.00,
        description: "Car insurance premium",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 9,
        transactionType: "Expense",
        walletId: 3,
        transactionCategory: "Health",
        transactionDate: DateTime(2024, 5, 23),
        amount: 75.50,
        description: "Prescription medication",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 10,
        transactionType: "Expense",
        walletId: 4,
        transactionCategory: "Clothing",
        transactionDate: DateTime(2024, 6, 7),
        amount: 120.75,
        description: "New formal attire",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),

      // 2025 Transactions (future planned)
      Transaction(
        id: 11,
        transactionType: "Expense",
        walletId: 5,
        transactionCategory: "Insurance",
        transactionDate: DateTime(2025, 1, 10),
        amount: 350.00,
        description: "Annual health insurance payment",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 12,
        transactionType: "Income",
        walletId: 6,
        transactionCategory: "Savings",
        transactionDate: DateTime(2025, 3, 15),
        amount: 3000.00,
        description: "Annual bonus deposit",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
      Transaction(
        id: 13,
        transactionType: "Expense",
        walletId: 1,
        transactionCategory: "Others",
        transactionDate: DateTime(2025, 4, 5),
        amount: 175.50,
        description: "Home maintenance expenses",
        receiptImage:
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
      ),
    ];
  }
}
