import 'dart:developer';

import 'package:bank_bot/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:translator/translator.dart';

class Chat extends StatefulWidget {
  final User user;
  const Chat({Key? key, required this.user}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  late DialogflowGrpcV2Beta1 dialogflow;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/credentials.json')));

    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  void handleSubmitted(text) async {
    print(text);
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
      name: "${_currentUser.displayName}",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });

    DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if (fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "Bank Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Bank Chat Bot'),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        const Divider(height: 1.0),
        Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: IconTheme(
              data: const IconThemeData(color: Colors.deepOrange),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: handleSubmitted,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Send a message"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () => handleSubmitted(_textController.text),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}

//------------------------------------------------------------------------------------
// The chat message balloon
//
//------------------------------------------------------------------------------------
class ChatMessage extends StatefulWidget {
  ChatMessage({this.text, this.name, this.type});

  final String? text;
  final String? name;
  final bool? type;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  GoogleTranslator translator = GoogleTranslator();
  String outPut = '';

  void trans() {
    translator
        .translate(widget.text!, to: 'ur') //translating to hi = hindi
        .then((output) {
      setState(() {
        outPut = output.toString();
      });
      log('$outPut');
    });
  }

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: const CircleAvatar(child: Text('B')),
      ),
      // InkWell(
      //   onTap: () {
      //     trans();
      //   },
      //   child:
      Expanded(
        child: InkWell(
          onTap: () {
            trans();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(widget.text!),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text('$outPut',
                      style: const TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
      // ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: InkWell(
          onTap: () {
            trans();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(widget.name!, style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(widget.text!),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text('$outPut',
                      style: const TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
            child: Text(
          widget.name![0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.type! ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
