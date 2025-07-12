enum SortOption {
  thisWeek('This week'),
  lastWeek('Last week'),
  thisMonth('This month'),
  lastMonth('Last month'),
  custom('Custom');

  const SortOption(this.value);

  final String value;
}
