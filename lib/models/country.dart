import 'dart:convert';
import 'package:COVID19_STATS/services/webservice.dart';

class Country {
  final String name;
  final int totalCases;
  final int totalDeaths;
  final int newCases;
  final int newDeaths;
  final int newRecovered;
  final int totalRecovered;

  Country(
      {this.name,
      this.totalCases,
      this.totalDeaths,
      this.newCases,
      this.newDeaths,
      this.newRecovered,
      this.totalRecovered});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['Country'],
      totalCases: json['TotalConfirmed'],
      totalDeaths: json['TotalDeaths'],
      newCases: json['NewConfirmed'],
      newDeaths: json['NewDeaths'],
      newRecovered: json['NewRecovered'],
      totalRecovered: json['TotalRecovered'],
    );
  }

  static Resource<List<Country>> get all {
    return Resource(
        url: 'https://api.covid19api.com/summary',
        parse: (response) {
          final result = json.decode(response.body);
          List list = result['Countries'];
          list.insert(0, result['Global']);
          return list.map((model) => Country.fromJson(model)).toList();
        });
  }
}
