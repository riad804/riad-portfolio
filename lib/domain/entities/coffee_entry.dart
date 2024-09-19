import 'package:equatable/equatable.dart';

class CoffeeEntry with EquatableMixin {
  const CoffeeEntry({
    required this.message,
    required this.amount,
  });

  final String message;
  final double amount;

  @override
  List<Object> get props => [
        message,
        amount,
      ];
}
