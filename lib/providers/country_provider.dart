import 'package:countriesapp/models/country_model.dart';
import 'package:countriesapp/services/api_services.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  final Apiservices _apiservices = Apiservices();

  bool _isFiltered = false;

  bool get isFiltered => _isFiltered;

  List<Country> filteredCountries = [];

  Future<List<Country>> getAllCountries() async {
    List<Country> allCountries = await _apiservices.getCountries();
    if (allCountries.isNotEmpty) {
      notifyListeners();
    }
    return allCountries;
  }

  void getFilteredCountries(
      [List<String>? filterCountry, List<String>? filterTimeZone]) {
    _isFiltered = !_isFiltered;
    notifyListeners();

    // for (Country element in allCountries) {
    //   if(element.continent != null){
    //     for(var continent in element.continent){}
    //   }

    // if (filterCountry!.contains(element.continent) ||
    //     filterTimeZone!.contains(element.timezone)) {
    //   filteredCountries.add(element);
    // }
    // }
  }
}
