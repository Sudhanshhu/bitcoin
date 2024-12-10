// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rates {
  final String id;
  final String symbol;
  final String? currencySymbol;
  final String? type;
  final String rateUsd;
  Rates({
    required this.id,
    required this.symbol,
    this.currencySymbol,
    this.type,
    required this.rateUsd,
  });

  Rates copyWith({
    String? id,
    String? symbol,
    String? currencySymbol,
    String? type,
    String? rateUsd,
  }) {
    return Rates(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      type: type ?? this.type,
      rateUsd: rateUsd ?? this.rateUsd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'symbol': symbol,
      'currencySymbol': currencySymbol,
      'type': type,
      'rateUsd': rateUsd,
    };
  }

  factory Rates.fromMap(Map<String, dynamic> map) {
    return Rates(
      id: map['id'] as String,
      symbol: map['symbol'] as String,
      currencySymbol: map['currencySymbol'] != null
          ? map['currencySymbol'] as String
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      rateUsd: map['rateUsd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rates.fromJson(String source) =>
      Rates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Rates(id: $id, symbol: $symbol, currencySymbol: $currencySymbol, type: $type, rateUsd: $rateUsd)';
  }

  @override
  bool operator ==(covariant Rates other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.symbol == symbol &&
        other.currencySymbol == currencySymbol &&
        other.type == type &&
        other.rateUsd == rateUsd;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        currencySymbol.hashCode ^
        type.hashCode ^
        rateUsd.hashCode;
  }
}
