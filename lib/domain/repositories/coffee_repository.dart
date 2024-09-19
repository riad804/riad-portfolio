import 'package:flutter_web3/flutter_web3.dart';
import 'package:portfolio_client/core/utils/typedefs.dart';
import 'package:portfolio_client/domain/entities/coffee_data.dart';
import 'package:portfolio_client/domain/entities/coffee_entry.dart';

abstract class CoffeeRepository {
  ResultFuture<Map<String, dynamic>> connectWallet();
  ResultFuture<void> sendCoffee(Contract contract, CoffeeEntry coffee);
  ResultFuture<String> getTotalCoffeeCount(Contract contract);
  ResultFuture<List<CoffeeData>> getAllCoffee(Contract contract);
}
