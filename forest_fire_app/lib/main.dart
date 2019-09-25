import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Colors.red,
      body: Text(
        'Seamless Prediction and Validation of Wildfires',
      ),
      title: Text(
        'Byte for Bait',
      ),
      titleTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
      mainImage: Icon(
        FontAwesomeIcons.fire,
        size: 200.0,
        color: Colors.white,
      ),
    ),
    PageViewModel(
      pageColor: Colors.green,
      body: Text(
        'SMS Service and Virtual Assistance',
      ),
      title: Text(''),
      titleTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
      mainImage: Icon(
        FontAwesomeIcons.sms,
        size: 200.0,
        color: Colors.white,
      ),
    ),
    PageViewModel(
      pageColor: Colors.deepPurple,
      body: Text(
        'Live Visualisation of Forest Fires',
      ),
      title: Text(''),
      mainImage: Icon(
        FontAwesomeIcons.map,
        size: 200.0,
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Lobster', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Byte for Bait', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
