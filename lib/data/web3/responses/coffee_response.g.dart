// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeResponse _$CoffeeResponseFromJson(Map<String, dynamic> json) =>
    CoffeeResponse(
      json['address'] as String,
      json['message'] as String,
      json['timestamp'] as String,
    );

Map<String, dynamic> _$CoffeeResponseToJson(CoffeeResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
