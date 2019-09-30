import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aboutpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Byte for Bait',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          BaseLayout(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Container(
                  height: 100.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 65.0, right: 10.0),
                        child: Icon(
                          FontAwesomeIcons.fire,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'FIRMS MAP',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  openMap();
                },
              ),
            ),
          ),
          Positioned(
            left: 50.0,
            right: 50.0,
            bottom: 280.0,
            child: GestureDetector(
              onTap: () {
                openWebPage();
              },
              child: Container(
                height: 100.0,
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'LAUNCH PORTAL',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.0,
            right: 50.0,
            bottom: 80.0,
            child: GestureDetector(
              onTap: () {
                openWebPage2();
              },
              child: Container(
                height: 100.0,
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'VISUALISATION',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        ),
        backgroundColor: Colors.white,
        tooltip: 'Bot',
        child: Icon(
          Icons.chat_bubble,
          color: Colors.black,
        ),
      ),
    );
  }

  openWebPage() async {
    const urlString = 'http://192.168.43.244:5000/form';
    if (await canLaunch(urlString)) {
      await launch(urlString, forceWebView: true,enableJavaScript: true);
    } else
      print('Cannot launch $urlString');
  }

  openMap() async {
    const url =
        'https://firms.modaps.eosdis.nasa.gov/wms/?REQUEST=GetMap&layers=fires_viirs,fires_modis&TIME=2019-09-01/2019-09-25&WIDTH=1024&HEIGHT=512&colors=240+40+40,250+200+50&size=2,2&BBOX=-180,-90,180,90&MAP_KEY=1926c681134f825becf694bf7d340e18';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      print('Cannot launch $url');
    }
  }

  openWebPage2() async {
    const urlString = 'http://192.168.43.244:5000/phone';
    if (await canLaunch(urlString)) {
      await launch(urlString, forceWebView: true,enableJavaScript: true);
    } else
      print('Cannot launch $urlString');
  }
}

class BaseLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bac.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
