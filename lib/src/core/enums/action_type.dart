enum ActionType {
  addExpense('Add expense'),
  addIncome('Add income');

  const ActionType(this.label);

  final String label;
}
