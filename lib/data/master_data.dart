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
