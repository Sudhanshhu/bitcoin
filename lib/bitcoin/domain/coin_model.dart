// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoinModel {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final double priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  CoinModel({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    required this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
  });

  CoinModel copyWith({
    String? id,
    String? rank,
    String? symbol,
    String? name,
    String? supply,
    String? maxSupply,
    String? marketCapUsd,
    String? volumeUsd24Hr,
    double? priceUsd,
    String? changePercent24Hr,
    String? vwap24Hr,
  }) {
    return CoinModel(
      id: id ?? this.id,
      rank: rank ?? this.rank,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      supply: supply ?? this.supply,
      maxSupply: maxSupply ?? this.maxSupply,
      marketCapUsd: marketCapUsd ?? this.marketCapUsd,
      volumeUsd24Hr: volumeUsd24Hr ?? this.volumeUsd24Hr,
      priceUsd: priceUsd ?? this.priceUsd,
      changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
      vwap24Hr: vwap24Hr ?? this.vwap24Hr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
    };
  }

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      id: map['id'] as String,
      rank: map['rank'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      supply: map['supply'] != null ? map['supply'] as String : null,
      maxSupply: map['maxSupply'] != null ? map['maxSupply'] as String : null,
      marketCapUsd:
          map['marketCapUsd'] != null ? map['marketCapUsd'] as String : null,
      volumeUsd24Hr:
          map['volumeUsd24Hr'] != null ? map['volumeUsd24Hr'] as String : null,
      priceUsd: double.tryParse(map['priceUsd']) ?? 0.0,
      changePercent24Hr: map['changePercent24Hr'] != null
          ? map['changePercent24Hr'] as String
          : null,
      vwap24Hr: map['vwap24Hr'] != null ? map['vwap24Hr'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoinModel(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr)';
  }

  @override
  bool operator ==(covariant CoinModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.rank == rank &&
        other.symbol == symbol &&
        other.name == name &&
        other.supply == supply &&
        other.maxSupply == maxSupply &&
        other.marketCapUsd == marketCapUsd &&
        other.volumeUsd24Hr == volumeUsd24Hr &&
        other.priceUsd == priceUsd &&
        other.changePercent24Hr == changePercent24Hr &&
        other.vwap24Hr == vwap24Hr;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        rank.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        supply.hashCode ^
        maxSupply.hashCode ^
        marketCapUsd.hashCode ^
        volumeUsd24Hr.hashCode ^
        priceUsd.hashCode ^
        changePercent24Hr.hashCode ^
        vwap24Hr.hashCode;
  }
}
