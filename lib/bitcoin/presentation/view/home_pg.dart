import 'package:bitcoinapp/bitcoin/domain/rates.dart';
import 'package:bitcoinapp/bitcoin/extension/string_extnsn.dart';
import 'package:bitcoinapp/bitcoin/presentation/cubit/coin_cubit.dart';
import 'package:bitcoinapp/bitcoin/presentation/view/display_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePg1 extends StatelessWidget {
  const HomePg1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinCubit(),
      child: const CoinPg(),
    );
  }
}

class CoinPg extends StatefulWidget {
  const CoinPg({super.key});

  @override
  State<CoinPg> createState() => _CoinPgState();
}

class _CoinPgState extends State<CoinPg> {
  late CoinCubit coinCubit;

  @override
  void initState() {
    coinCubit = BlocProvider.of<CoinCubit>(context);
    coinCubit.getCoinData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bitcoin-app'.removeDashAndCapsFirst().capitalizeEach()),
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          if (state is CoinLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoinLoaded) {
            return Column(
              children: [
                // Create a dropdown to select the currency
                Container(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton<Rates>(
                    items: coinCubit.rates.map((Rates rate) {
                      return DropdownMenuItem<Rates>(
                        value: rate,
                        child: Text(rate.id),
                      );
                    }).toList(),
                    onChanged: (value) {
                      coinCubit.changeRate(value!);
                    },
                    hint: const Text("Select Currency"),
                    value: coinCubit.selectedRate,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.coins.length,
                    itemBuilder: (context, index) {
                      return DisplayCoin(
                        coin: state.coins[index],
                        selectedRate: coinCubit.selectedRate,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is CoinError) {
            return Column(
              children: [
                Center(child: Text(state.message)),
                TextButton(
                    onPressed: coinCubit.getCoinData,
                    child: const Text("Try Again"))
              ],
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
