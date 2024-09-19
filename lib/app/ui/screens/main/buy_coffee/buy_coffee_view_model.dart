import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_client/domain/bloc/buy_coffee_bloc.dart';

class BuyCoffeeViewModel {
  void connectWallet(BuildContext context) {
    context.read<BuyCoffeeBloc>().handleWalletConnection();
  }

  void buyCoffee(BuildContext context) {
    context.read<BuyCoffeeBloc>().handleBuyCoffee();
  }

  void fetchTotalCoffeeCount(BuildContext context) {
    context.read<BuyCoffeeBloc>().handleFetchCoffeeCounts();
  }

  void fetchAllCoffees(BuildContext context) {
    context.read<BuyCoffeeBloc>().handleFetchCoffees();
  }

  void setMessage(BuildContext context, String value) {
    context.read<BuyCoffeeBloc>().onMessageChanged(value);
  }

  void setAmount(BuildContext context, double value) {
    context.read<BuyCoffeeBloc>().onAmountChanged(value);
  }

  double getAmount(BuildContext context) {
    return context.read<BuyCoffeeBloc>().amount;
  }
}
