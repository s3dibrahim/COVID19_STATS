import 'package:flutter/material.dart';
import 'package:COVID19_STATS/models/country.dart';
import 'package:COVID19_STATS/routes/details.dart';
import 'package:COVID19_STATS/widgets/Divider.dart';

class HomePage extends StatelessWidget {
  final List<Country> countries;
  HomePage({@required this.countries});

  _onItemTap(Country country, BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => Details(country: country),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _countriesListView(),
    );
  }

  ListView _countriesListView() {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              title: Text(
                'WORLD',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                countries[index].totalCases.toString(),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  listDevider(),
                  ListTile(
                    dense: true,
                    title: Text(
                      countries[index].name,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: Text(
                      countries[index].totalCases.toString(),
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => _onItemTap(countries[index], context),
                  ),
                ],
              ),
            );
          }
        });
  }
}
