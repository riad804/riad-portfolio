import 'package:dartz/dartz.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_client/core/errors/failures.dart';
import 'package:portfolio_client/core/utils/typedefs.dart';
import 'package:portfolio_client/data/web3/coffee_api.dart';
import 'package:portfolio_client/data/web3/responses/coffee_mapper.dart';
import 'package:portfolio_client/domain/entities/coffee_data.dart';
import 'package:portfolio_client/domain/entities/coffee_entry.dart';
import 'package:portfolio_client/domain/repositories/coffee_repository.dart';

@Singleton(as: CoffeeRepository)
class CoffeeRespositoryImpl implements CoffeeRepository {
  const CoffeeRespositoryImpl(this._coffeeApi);

  final CoffeeApi _coffeeApi;

  @override
  ResultFuture<Map<String, dynamic>> connectWallet() async {
    try {
      if (Ethereum.isSupported) {
        List<String> accs = await _coffeeApi.connectWallet();
        if (accs.isNotEmpty) {
          return right({
            "address": accs.first,
            "chain": await ethereum!.getChainId(),
          });
        } else {
          return left(const ContractFailure(
            message: "Connection Denied",
            statusCode: 3,
          ));
        }
      } else {
        return left(const ContractFailure(
          message: "Connection Denied",
          statusCode: 3,
        ));
      }
    } catch (e) {
      return left(const ContractFailure(
        message: "MetaMask not installed",
        statusCode: 3,
      ));
    }
  }

  @override
  ResultFuture<List<CoffeeData>> getAllCoffee(Contract contract) async {
    try {
      final coffees = await _coffeeApi.fetchAllCoffees(contract);
      final data = coffees.map((coffee) => coffee.toData()).toList();
      return right(data);
    } catch (e) {
      return left(const ContractFailure(
        message: "Failed to get coffees",
        statusCode: 3,
      ));
    }
  }

  @override
  ResultFuture<String> getTotalCoffeeCount(Contract contract) async {
    try {
      final count = await _coffeeApi.fetchTotalCoffee(contract);
      return right(count);
    } catch (e) {
      return left(const ContractFailure(
        message: "Failed to get coffee counts",
        statusCode: 3,
      ));
    }
  }

  @override
  ResultFuture<void> sendCoffee(Contract contract, CoffeeEntry coffee) async {
    try {
      await _coffeeApi.sendCoffee(contract, coffee.message, coffee.amount);
      return right(null);
    } catch (e) {
      return left(const ContractFailure(
        message: "Failed to Buy coffee",
        statusCode: 3,
      ));
    }
  }
}
