import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:COVID19_STATS/models/country.dart';
import 'package:COVID19_STATS/routes/details.dart';
import 'package:COVID19_STATS/widgets/Divider.dart';

class SearchPage extends StatefulWidget {
  final List<Country> countries;
  SearchPage({@required this.countries});

  @override
  _SearchPageState createState() => _SearchPageState(countries);
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textController = TextEditingController();

  var countries = List<Country>();
  _SearchPageState(this.countries);

  var _searchResults = List<Country>();

  _onItemChanged(String value) {
    setState(() {
      _searchResults.clear();
      if (value.isNotEmpty) {
        _searchResults = countries
            .where((country) =>
                country.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        _searchResults.clear();
      }
    });
  }

  _onItemTap(Country country) {
    setState(() {
      _searchResults.clear();
      _textController.clear();
    });
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => Details(country: country),
    ));
  }

  @override
  void initState() {
    super.initState();
    countries.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              controller: _textController,
              prefix: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.search),
              ),
              placeholder: 'Search',
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: _onItemChanged,
            ),
            Expanded(
              child: ListView(
                children: _searchResults.map((country) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(country.name),
                        onTap: () => _onItemTap(country),
                      ),
                      listDevider()
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
