import 'package:flutter/material.dart';
import 'package:COVID19_STATS/models/country.dart';

class Details extends StatelessWidget {
  final Country country;
  Details({@required this.country});

  Widget covidStats(String title, int count) {
    return Container(
        padding: EdgeInsets.all(8),
        child: ListTile(
          dense: true,
          title: Text(title, style: TextStyle(fontSize: 10)),
          subtitle: Text(count.toString()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(height: 50),
                Text(country.name, textAlign: TextAlign.center),
                Text(
                  'CORONA STATS OVERVIEW',
                  style: TextStyle(fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 2.0,
        crossAxisCount: 2,
        children: <Widget>[
          covidStats('TOTAL CASES', country.totalCases),
          covidStats('TOTAL DEATHS', country.totalDeaths),
          covidStats('NEW CASES', country.newCases),
          covidStats('NEW DEATHS', country.totalDeaths),
          covidStats('NEW RECOVERED', country.newRecovered),
          covidStats('TOTAL RECOVERED', country.totalRecovered),
        ],
      ),
    );
  }
}
