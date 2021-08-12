import 'package:nuconta_marketplace/ui/utils/regex.dart';

extension DoubleExtentions on double {
  String get toCurrency {
    return 'R\$ ${toStringAsFixed(2)}'
        .replaceFirst('.', ',')
        .replaceAll(RegExp(thousandRegex), '.');
  }
}
