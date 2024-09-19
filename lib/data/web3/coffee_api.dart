import 'package:flutter_web3/flutter_web3.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_client/data/web3/responses/coffee_response.dart';

@singleton
class CoffeeApi {
  // Future connectWallet() async => await js.context.callMethod('connectWallet');
  Future connectWallet() async => await ethereum!.requestAccount();
  Future sendCoffee(Contract contract, String message, double ethValue) async =>
      await contract.send(
        'buyMeACoffee',
        [message],
        TransactionOverride(value: BigInt.from(ethValue * 1e18)),
      );

  Future fetchTotalCoffee(Contract contract) async =>
      await contract.call('getTotalCoffee');
  Future<List<CoffeeResponse>> fetchAllCoffees(Contract contract) async {
    final coffees = await contract.call('getAllCoffees');
    final data =
        coffees.entries.map((entry) => CoffeeResponse.fromJson(entry)).toList();
    return data;
  }
}
