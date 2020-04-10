import 'package:first_web/layout_template.dart';
import 'package:first_web/theme.dart';
import 'package:flutter/material.dart';

import 'app_localizations.dart';
import 'commons/collapsing_navigation_drawer_widget.dart';
import 'locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ta', 'IN'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: LayoutTemplate(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index=0;
  double width=70.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          
            if(index==1)
                  Container()
            else    
                  Page2(width: width,),

             CollapsingNavigationDrawer(
              onTab: (index) => {
                this.index=index
                },
               onClose: ()=>{

               }, 
            ),
            ]
        ));
  }

  
}


class Page2 extends StatelessWidget {
  final double width;
  Page2({this.width=0.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: 300),
              CardTile(
                iconBgColor: Colors.orange,
                cardTitle: 'Booking',
              ),
              SizedBox(width: 30),
              CardTile(
                iconBgColor: Colors.pinkAccent,
                cardTitle: 'Booking',
              ),
              SizedBox(width: 30),
              CardTile(
                iconBgColor: Colors.green,
                cardTitle: 'Booking',
              ),
              SizedBox(width: 30),
              CardTile(
                iconBgColor: Colors.lightBlueAccent,
                cardTitle: 'Booking',
              ),
              SizedBox(width: 30),
            ],
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
       showAlertDialog(context);
      },
      child: Icon(Icons.navigation),
      backgroundColor: Colors.green,
    ),
  );
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
new ListTile(
            leading: new Icon(Icons.music_note),
            title: new Text('Music'),
            onTap: () => {}          
          ),
          new ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Video'),
            onTap: () => {},          
          ),
            ],
          ),
          );
      }
    );
}

showAlertDialog(BuildContext context) {  
 showDialog(
              context: context,
              builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Alert Dialog"),
                    content: Text("Dialog Content"),
                  );
              }
            );
}
}


class CardTile extends StatelessWidget {
  final String cardTitle;
  final IconData icon;
  final Color iconBgColor;
  final String mainText;
  final String subText;

  const CardTile(
      {Key key,
      this.cardTitle,
      this.icon,
      this.iconBgColor,
      this.mainText="",
      this.subText=""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return FittedBox(
      child: Container(
        height: _media.height / 6,
        width: _media.width / 7,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Material(
              elevation: 10,
              color: Colors.white,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: _media.height / 6.5,
                width: _media.width / 7,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      cardTitle,
                      style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: Text(
                        mainText,
                        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Spacer(),
                    Divider(),
                    Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          child: Text(
                            subText,
                            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 20,
              child: Material(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(4),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: _media.height / 18,
                  width: _media.width / 20,
                  child: Icon(
                    icon,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}