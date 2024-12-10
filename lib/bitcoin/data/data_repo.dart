import 'dart:convert';

import 'package:bitcoinapp/bitcoin/domain/coin_model.dart';
import 'package:bitcoinapp/bitcoin/domain/rates.dart';
import 'package:http/http.dart' as http;

abstract class DataRepo {
  Future<List<CoinModel>> getCoinData();
  Future<List<Rates>> getRates();
}

class DataRepoImpl implements DataRepo {
  @override
  Future<List<CoinModel>> getCoinData() async {
    final url = Uri.parse('https://api.coincap.io/v2/assets');
    // fetch rates in INR

    try {
      final response = await http.get(url); // Await the response
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List<dynamic> data = body['data'];

        List<CoinModel> coinList =
            data.map((e) => CoinModel.fromMap(e)).toList();
        return coinList;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  @override
  Future<List<Rates>> getRates() async {
    final url = Uri.parse('https://api.coincap.io/v2/rates');
    try {
      final response = await http.get(url); // Await the response
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List<dynamic> data = body['data'];

        List<Rates> ratesList = data.map((e) => Rates.fromMap(e)).toList();
        return ratesList;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
