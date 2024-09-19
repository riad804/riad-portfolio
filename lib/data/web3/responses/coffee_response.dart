import 'package:json_annotation/json_annotation.dart';

part 'coffee_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CoffeeResponse {
  const CoffeeResponse(
    this.address,
    this.message,
    this.timestamp,
  );

  final String address;
  final String message;
  final String timestamp;

  factory CoffeeResponse.fromJson(Map<String, String> json) =>
      _$CoffeeResponseFromJson(json);
}
