import 'package:equatable/equatable.dart';

class CoffeeData with EquatableMixin {
  const CoffeeData({
    required this.address,
    required this.message,
    required this.timestamp,
  });

  final String address;
  final String message;
  final String timestamp;

  @override
  List<Object> get props => [
        address,
        message,
        timestamp,
      ];
}
