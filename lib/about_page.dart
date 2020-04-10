import 'package:first_web/responsive_builder.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: <Widget>[
          ScreenTypeLayout(
                      mobile: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/1,
                  child: Card(
                    elevation: 5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/1,
                  child: Card(
                    elevation: 5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/1,
                  child: Card(
                    elevation: 5,
                  ),
                )
              ],
            ),
             desktop: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
