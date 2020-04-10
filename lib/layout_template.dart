import 'package:first_web/route_names.dart';
import 'package:first_web/router.dart';
import 'package:first_web/theme.dart';
import 'package:flutter/material.dart';

import 'commons/collapsing_navigation_drawer_widget.dart';
import 'locator.dart';
import 'navigation_bar.dart';
import 'navigation_service.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackgroundColor,
          title: Text(
            "Gym Weight",
          ),
        ),
        // drawer: CollapsingNavigationDrawer( onTab: (index)=>{
        //   print(index.toString())
        // },),
        body: Stack(
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.only(left: 70.0, right: 10.0),
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: AboutRoute,
                ),
              ),
              CollapsingNavigationDrawer(),
            ]
        ));
    
  }
}
