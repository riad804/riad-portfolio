import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:portfolio_client/app/ui/commons/title_widget.dart';
import 'package:portfolio_client/core/utils/string_formats.dart';
import 'package:portfolio_client/domain/bloc/buy_coffee_bloc.dart';
import 'package:portfolio_client/domain/states/buy_coffee_state.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/colors.dart';

import 'buy_coffee_view_model.dart';

class BuyCoffeeView extends StatefulWidget {
  const BuyCoffeeView({
    required this.viewModel,
    super.key,
  });

  final BuyCoffeeViewModel viewModel;

  @override
  State<BuyCoffeeView> createState() => _BuyCoffeeViewState();
}

class _BuyCoffeeViewState extends State<BuyCoffeeView> {
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  String currentAddress = '';

  int currentChain = -1;

  clear() {
    setState(() {
      currentAddress = '';
      currentChain = -1;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchAllCoffees(context);
      widget.viewModel.fetchTotalCoffeeCount(context);
    });

    if (Ethereum.isSupported) {
      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(title: "Buy me a coffee"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: FilledButton(
                          child: BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                              builder: (ctx, state) {
                            String error = '';
                            if (state is WalletConnectedState) {
                              currentAddress = state.data["address"];
                              currentChain = state.data["chain"];
                            } else if (state is FailedWalletConnectionState) {
                              error = state.error.message;
                            }
                            return Text(
                              isConnected
                                  ? currentAddress.toSecret()
                                  : error.isNotEmpty &&
                                          error.contains("not available")
                                      ? error
                                      : "Connect to wallet",
                              style: AppText.b2!.cl(AppColors.primary),
                            );
                          }),
                          onPressed: () async {
                            widget.viewModel.connectWallet(context);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tip Amount",
                            style: AppText.b2!.cl(AppColors.primary)),
                        Text("*Must be greater than 0",
                            style: AppText.l2!.cl(AppColors.secondary)),
                        const SizedBox(height: 10),
                        BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                            builder: (ctx, state) {
                          return NumberBox(
                            value: widget.viewModel.getAmount(context),
                            onChanged: (double? value) {
                              print(value);
                              widget.viewModel.setAmount(context, value ?? 0);
                            },
                            smallChange: 0.1,
                            mode: SpinButtonPlacementMode.inline,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Message",
                            style: AppText.b2!.cl(AppColors.primary)),
                        const SizedBox(height: 10),
                        BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                            builder: (ctx, state) {
                          return TextBox(
                            placeholder: 'write a message...',
                            expands: false,
                            onChanged: (value) {
                              widget.viewModel.setMessage(context, value);
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                            builder: (ctx, state) {
                          if (state is FormSuccessState) {
                            print("success buying");

                            widget.viewModel.fetchAllCoffees(context);
                            widget.viewModel.fetchTotalCoffeeCount(context);
                          }
                          return FilledButton(
                            onPressed: state is FormValidState && isConnected
                                ? () async {
                                    widget.viewModel.buyCoffee(context);
                                  }
                                : null,
                            child: state is FormSubmittingState
                                ? const ProgressRing(
                                    activeColor: AppColors.primary)
                                : Text(
                                    'Buy Coffee',
                                    style: AppText.b2!.cl(AppColors.primary),
                                  ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height - 140,
                  color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recent Coffees", style: AppText.b1b),
                          BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                              buildWhen: (_, state) =>
                                  state is CoffeeCountState,
                              builder: (ctx, state) {
                                if (state is FetchedCoffeeCountState) {
                                  return Text(state.count, style: AppText.b1);
                                } else {
                                  return Text("0", style: AppText.b1);
                                }
                              }),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: BlocBuilder<BuyCoffeeBloc, BuyCoffeeState>(
                            buildWhen: (_, state) => state is CoffeesState,
                            builder: (ctx, state) {
                              if (state is FetchedCoffeesState) {
                                return ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemCount: state.data.length,
                                  itemBuilder: (_, index) {
                                    final coffee = state.data[index];
                                    return ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(coffee.address,
                                              style: AppText.l1!
                                                  .cl(AppColors.secondary)),
                                          Text(coffee.timestamp,
                                              style: AppText.l1!
                                                  .cl(AppColors.secondary)),
                                        ],
                                      ),
                                      subtitle: Text(coffee.message,
                                          style: AppText.l1!
                                              .cl(AppColors.secondary)),
                                    );
                                  },
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
