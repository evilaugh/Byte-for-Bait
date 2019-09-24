import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aboutpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppLocalhostServer localhostServer = new InAppLocalhostServer();

  @override
  void initState() {
    super.initState();
    localhostServer.start();
  }

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
                  decoration: myBoxDecoration(),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 65.0, right: 10.0),
                        child: Icon(
                          FontAwesomeIcons.fire,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FIRMS MAP',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
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
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                openWebPage();
              },
              child: Container(
                height: 100.0,
                width: 300.0,
                decoration: myBoxDecoration(),
                child: Center(
                  child: Text(
                    'LAUNCH PORTAL',
                    style: TextStyle(
                      color: Colors.white,
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
    const urlString = 'https://github.com';
    if (await canLaunch(urlString)) {
      await launch(urlString, forceWebView: true);
    } else
      print('Cannot launch $urlString');
  }

  openMap() async {
    const url =
        'https://firms.modaps.eosdis.nasa.gov/wms/?REQUEST=GetMap&layers=fires_viirs_24&WIDTH=1024&HEIGHT=512&BBOX=-180,-90,180,90&MAP_KEY=9af742ed0a76b34533f2b6bbd07f6ee3';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      print('Cannot launch $url');
    }
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

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border(
      left: BorderSide(
        color: Colors.white,
        width: 20,
      ),
      top: BorderSide(
        color: Colors.white,
        width: 15,
      ),
      right: BorderSide(
        color: Colors.white,
        width: 20.0,
      ),
      bottom: BorderSide(
        color: Colors.white,
        width: 15,
      ),
    ),
  );
}
