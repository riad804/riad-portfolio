import 'package:equatable/equatable.dart';
import 'package:portfolio_client/core/errors/failures.dart';
import 'package:portfolio_client/domain/entities/coffee_data.dart';

sealed class BuyCoffeeState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialBuyCoffeeState extends BuyCoffeeState {}

// wallet connection
sealed class WalletConnectionState extends BuyCoffeeState {}

class LoadingWalletConnectionState extends WalletConnectionState {}

class FailedWalletConnectionState extends WalletConnectionState {
  FailedWalletConnectionState(this.error);

  final Failure error;

  @override
  List<Object> get props => [error];
}

class WalletConnectedState extends WalletConnectionState {
  WalletConnectedState(this.data);

  final Map<String, dynamic> data;

  @override
  List<Object> get props => [data];
}

// get coffee counts
sealed class CoffeeCountState extends BuyCoffeeState {}

class FetchingCoffeeCountState extends CoffeeCountState {}

class FetchFailCoffeeCountState extends CoffeeCountState {
  FetchFailCoffeeCountState(this.error);

  final Failure error;

  @override
  List<Object> get props => [error];
}

class FetchedCoffeeCountState extends CoffeeCountState {
  FetchedCoffeeCountState(this.count);

  final String count;

  @override
  List<Object> get props => [count];
}

// get coffees list
sealed class CoffeesState extends BuyCoffeeState {}

class FetchingCoffeesState extends CoffeesState {}

class FetchFailCoffeesState extends CoffeesState {
  FetchFailCoffeesState(this.error);

  final Failure error;

  @override
  List<Object> get props => [error];
}

class FetchedCoffeesState extends CoffeesState {
  FetchedCoffeesState(this.data);

  final List<CoffeeData> data;

  @override
  List<Object> get props => [data];
}

// send transaction
sealed class BuyACoffeeState extends BuyCoffeeState {}

class FormSuccessState extends BuyACoffeeState {}

class FormFailureState extends BuyACoffeeState {
  FormFailureState(this.error);

  final Failure error;

  @override
  List<Object> get props => [error];
}

// class AmountChangeState extends BuyACoffeeState {
//   final int amount;

//   AmountChangeState(this.amount);

//   @override
//   List<Object> get props => [amount];
// }

class FormSubmittingState extends BuyACoffeeState {}

class FormValidState extends BuyACoffeeState {}

class FormInvalid extends BuyACoffeeState {
  final String error;

  FormInvalid(this.error);

  @override
  List<Object> get props => [error];
}
