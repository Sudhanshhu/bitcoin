import 'package:bitcoinapp/bitcoin/data/data_repo.dart';
import 'package:bitcoinapp/bitcoin/domain/coin_model.dart';
import 'package:bitcoinapp/bitcoin/domain/rates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  CoinCubit() : super(CoinInitial());
  DataRepoImpl dataRepo = DataRepoImpl();
  Rates? _selectedRate;
  Rates? get selectedRate => _selectedRate;
  List<CoinModel> coins = [];
  List<Rates> _rates = [];
  List<Rates> get rates => _rates;

  Future getCoinData() async {
    emit(CoinLoading());
    try {
      coins = await dataRepo.getCoinData();
      _rates = await dataRepo.getRates();
      _selectedRate = rates.firstWhere((element) => element.symbol == 'INR');
      emit(CoinLoaded(coins));
    } catch (e) {
      emit(CoinError(e.toString()));
    }
  }

  void changeRate(Rates rate) {
    emit(CoinLoading());
    _selectedRate = rate;
    // convert all the prices to the selected rate
    coins = coins.map((e) {
      final price = e.priceUsd;
      final rate = double.parse(selectedRate!.rateUsd);
      final convertedPrice = price * rate;
      return e.copyWith(priceUsd: convertedPrice);
    }).toList();
    emit(CoinLoaded(coins));
  }
}
