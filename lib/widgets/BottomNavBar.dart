import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:COVID19_STATS/models/country.dart';
import 'package:COVID19_STATS/services/webservice.dart';
import 'package:COVID19_STATS/routes/home.dart';
import 'package:COVID19_STATS/routes/search.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<NavigatorState> homeNavkey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> searchNavKey = GlobalKey<NavigatorState>();
  var _countries = List<Country>();
  var showTabBar = false;
  @override
  void initState() {
    super.initState();
    _getCovidData();
  }

  void _getCovidData() {
    Webservice().load(Country.all).then((countries) => {
          setState(() => {_countries = countries})
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.teal,
          activeColor: Colors.white,
          inactiveColor: Colors.teal[300],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return CupertinoTabView(
                navigatorKey: homeNavkey,
                builder: (context) => HomePage(countries: _countries));
          } else {
            return CupertinoTabView(
                navigatorKey: searchNavKey,
                builder: (context) => SearchPage(countries: _countries));
          }
        });
  }
}
