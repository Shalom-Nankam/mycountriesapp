import 'dart:convert';

import 'package:countriesapp/models/country_model.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  Future<List<Country>> getCountries() async {
    List<Country> countries = [];

    try {
      final firstData =
          await doGetFullRequest('https://restcountries.com/v3.1/all');
      if (isConnectionSuccesful(firstData.statusCode)) {
        print('got data');
        final decodedBody =
            jsonDecode(firstData.body).cast<Map<String, dynamic>>();

        print('decoded data');
        countries =
            decodedBody.map<Country>((json) => Country.fromMap(json)).toList();
        print('finished');
      }
    } on Exception {
      throw Exception('There was an error');
    }
    return countries;
  }

  bool isConnectionSuccesful(int statusCode) {
    return statusCode == 201 || statusCode == 200;
  }

  Future<http.Response> doGetFullRequest(
    String endPoint,
  ) async {
    return http.get(
      Uri.parse(endPoint),
    );
  }
}
