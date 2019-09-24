import 'package:flutter/material.dart';
import 'botmessages.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<BotMessages> _messages = <BotMessages>[];
  FlutterTts _tts = new FlutterTts();

  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Aiuto Bot',
          style: TextStyle(fontFamily: 'Lobster', color: Colors.white),
        ),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true, //To keep the latest messages at the bottom
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    );
  }

  void _submitQuery(String text) {
    _textController.clear();
    BotMessages message = new BotMessages(
      text: text,
      name: 'User',
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/byteforbaitbot.json").build();
    Dialogflow dialogFlow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    BotMessages message = BotMessages(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Aiuto",
      type: false,
    );
    _tts.speak(response.getMessage());
    setState(() {
      _messages.insert(0, message);
    });
  }
}
