extension DoubleExtension on double {
  String get formattedCurrencyBR =>
      'R\$${toStringAsFixed(2).replaceAll('.', ',')}';
}
