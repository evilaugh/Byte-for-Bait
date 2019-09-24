import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Team Members',
          style: TextStyle(color: Colors.white, fontFamily: 'Lobster'),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 100.0,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: ExactAssetImage(
                        'assets/avikant.jpeg',
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.github),
                        onPressed: () =>
                            _launchUrl('https://github.com/AvikantSrivastava')),
                    title: Text(
                      'AVIKANT SRIVASTAVA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Second Year, ISE, SMVIT'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 100.0,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: ExactAssetImage(
                          'assets/sanyam.jpeg',
                        )),
                    trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.github),
                        onPressed: () =>
                            _launchUrl('https://github.com/Sanyam8055')),
                    title: Text(
                      'SANYAM SINGH',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Second Year, ISE, SMVIT'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 100.0,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: ExactAssetImage(
                          'assets/harsh.jpeg',
                        )),
                    trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.github),
                        onPressed: () =>
                            _launchUrl('https://github.com/DooMLoRD03')),
                    title: Text(
                      'HARSH SHRIVASTAVA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Second Year, ISE, SMVIT'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 100.0,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: ExactAssetImage(
                          'assets/akshat.jpg',
                        )),
                    trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.github),
                        onPressed: () =>
                            _launchUrl('https://github.com/akshatjaipuria')),
                    title: Text(
                      'AKSHAT JAIPURIA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Third Year, CSE, SMVIT'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 100.0,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: ExactAssetImage(
                          'assets/sunchit.jpeg',
                        )),
                    trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.github),
                        onPressed: () =>
                            _launchUrl('https://github.com/sunchit17')),
                    title: Text(
                      'SUNCHIT LAKHANPAL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Third Year, CSE, SMVIT'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchUrl(String s) async {
    if (await canLaunch(s)) {
      await launch(s,forceWebView: true);
    } else {
      throw 'Could not launch $s';
    }
  }
}
