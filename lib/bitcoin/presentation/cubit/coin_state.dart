part of 'coin_cubit.dart';

sealed class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

final class CoinInitial extends CoinState {}

final class CoinLoading extends CoinState {}

final class CoinLoaded extends CoinState {
  final List<CoinModel> coins;

  const CoinLoaded(this.coins);

  @override
  List<Object> get props => [coins];
}

final class CoinError extends CoinState {
  final String message;

  const CoinError(this.message);

  @override
  List<Object> get props => [message];
}
