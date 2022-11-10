import 'package:countriesapp/models/country_model.dart';
import 'package:countriesapp/services/api_services.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  final Apiservices _apiservices = Apiservices();
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  List<Country> allCountries = [];
  List<Country> filteredCountries = [];

  void getAllCountries() async {
    _isFetching = !_isFetching;
    notifyListeners();
    allCountries = await _apiservices.getCountries();
    if (allCountries.isNotEmpty) {
      _isFetching = !_isFetching;
      notifyListeners();
    }
  }
}
