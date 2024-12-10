// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:bitcoinapp/bitcoin/domain/coin_model.dart';
import 'package:bitcoinapp/bitcoin/domain/rates.dart';

class DisplayCoin extends StatelessWidget {
  final CoinModel coin;
  final Rates? selectedRate;
  const DisplayCoin({
    super.key,
    required this.coin,
    this.selectedRate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(coin.rank)),
      title: Text(coin.name),
      subtitle: Text(coin.symbol),
      trailing: Text('${selectedRate?.currencySymbol ?? ""} ${coin.priceUsd}'),
    );
  }
}
