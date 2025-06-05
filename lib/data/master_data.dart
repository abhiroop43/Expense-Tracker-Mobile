class ExpenseType {
  final String id;
  final String code;
  final String description;

  ExpenseType({
    required this.id,
    required this.code,
    required this.description,
  });

  static List<ExpenseType> getExpenseTypes() {
    return [
      ExpenseType(id: '1', code: 'EXP', description: 'Expense'),
      ExpenseType(id: '2', code: 'INC', description: 'Income'),
    ];
  }
}

class TransactionCategory {
  final String id;
  final String code;
  final String description;

  TransactionCategory({
    required this.id,
    required this.code,
    required this.description,
  });

  static List<TransactionCategory> getTransactionCategories() {
    return [
      TransactionCategory(id: '1', code: 'HLT', description: 'Health'),
      TransactionCategory(id: '2', code: 'CLT', description: 'Clothing'),
      TransactionCategory(id: '3', code: 'INC', description: 'Income'),
      TransactionCategory(id: '4', code: 'SAV', description: 'Savings'),
      TransactionCategory(id: '5', code: 'DIN', description: 'Dining'),
      TransactionCategory(id: '6', code: 'PRL', description: 'Personal'),
      TransactionCategory(id: '7', code: 'INS', description: 'Insurance'),
      TransactionCategory(id: '8', code: 'OTH', description: 'Others'),
    ];
  }
}
