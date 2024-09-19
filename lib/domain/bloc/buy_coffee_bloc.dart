import 'package:flutter_web3/flutter_web3.dart';
import 'package:portfolio_client/core/errors/failures.dart';
import 'package:portfolio_client/core/utils/contract.dart';
import 'package:portfolio_client/domain/bloc/base_bloc.dart';
import 'package:portfolio_client/domain/entities/coffee_entry.dart';
import 'package:portfolio_client/domain/repositories/coffee_repository.dart';
import 'package:portfolio_client/domain/states/buy_coffee_state.dart';

class BuyCoffeeBloc extends BaseBloc<BuyCoffeeState> {
  late Contract coffeeContract;
  String message = '';
  double amount = 0.0;

  BuyCoffeeBloc(this._coffeeRepository) : super(InitialBuyCoffeeState()) {
    if (Ethereum.isSupported) {
      coffeeContract =
          Contract(contractAddress, Interface(abi), provider!.getSigner());
    }

    // on<GetCoffeeCountEvent>(_handleFetchCoffeeCounts);
    // on<GetCoffeesEvent>(_handleFetchCoffees);
    // on<WalletConnectEvent>(_handleWalletConnection);
    // on<FormSubmitEvent>(_handleBuyCoffee);

    // on<MessageChanged>((event, emit) {});
    // on<AmountChanged>((event, emit) {
    //   amount = event.amount;
    //   _validateForm(emit);
    // });
  }

  final CoffeeRepository _coffeeRepository;

  onMessageChanged(String message) {
    this.message = message;
    _validateForm();
  }

  onAmountChanged(double amount) {
    this.amount = amount;
    _validateForm();
  }

  Future<void> handleFetchCoffeeCounts() async {
    emit(FetchingCoffeeCountState());
    final data = await _coffeeRepository.getTotalCoffeeCount(coffeeContract);
    data.fold(
      (Failure error) {
        emit(FetchFailCoffeeCountState(error));
      },
      (data) {
        emit(FetchedCoffeeCountState(data));
      },
    );
  }

  Future<void> handleFetchCoffees() async {
    emit(FetchingCoffeesState());
    final data = await _coffeeRepository.getAllCoffee(coffeeContract);
    data.fold(
      (Failure error) {
        emit(FetchFailCoffeesState(error));
      },
      (data) {
        emit(FetchedCoffeesState(data));
      },
    );
  }

  Future<void> handleWalletConnection() async {
    emit(LoadingWalletConnectionState());
    if (Ethereum.isSupported) {
      final data = await _coffeeRepository.connectWallet();
      data.fold(
        (Failure error) {
          emit(FailedWalletConnectionState(error));
        },
        (data) {
          print(data);
          emit(WalletConnectedState(data));
        },
      );
    } else {
      emit(FailedWalletConnectionState(
        const ContractFailure(
          message: "Meta mask not available",
          statusCode: 3,
        ),
      ));
    }
  }

  Future<void> handleBuyCoffee() async {
    emit(FormSubmittingState());
    final data = await _coffeeRepository.sendCoffee(
        coffeeContract, CoffeeEntry(message: message, amount: amount));
    data.fold(
      (Failure error) {
        emit(FormFailureState(error));
      },
      (data) {
        emit(FormSuccessState());
      },
    );
  }

  void _validateForm() {
    if (message.isNotEmpty) {
      emit(FormValidState());
    } else if (amount > 0) {
      emit(FormInvalid('Amount must be greater than 0'));
    } else {
      emit(FormInvalid('Please write a short message for me'));
    }
  }
}
