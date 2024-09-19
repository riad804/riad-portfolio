import 'package:portfolio_client/domain/entities/coffee_data.dart';

import 'coffee_response.dart';

extension MovieMapper on CoffeeResponse {
  CoffeeData toData() => CoffeeData(
        address: address,
        message: message,
        timestamp: timestamp,
      );
}
