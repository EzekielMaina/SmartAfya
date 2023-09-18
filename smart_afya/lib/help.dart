import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final String image;

  ChatMessage({required this.text, required this.isMe, required this.image});
}

class HelpPage extends StatefulWidget {
  final bool first = true;

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  int error = 0;
  List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.first) {
      _generateWelcomeMessage();
    }
  }

  void _generateWelcomeMessage() {
    ChatMessage message = ChatMessage(
      text:
          'Welcome to Smart Afya Support Center! How can I assist you today? ',
      isMe: false,
      image: 'assets/robot.jpeg',
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmit(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMe: true,
      image: 'assets/user.jpg',
    );
    setState(() {
      _messages.insert(0, message);
    });
    // add a response message after a delay to simulate the bot's response
    Future.delayed(Duration(milliseconds: 500), () {
      ChatMessage response = _getBotResponse(text);
      setState(() {
        _messages.insert(0, response);
      });
    });
  }

  ChatMessage _getBotResponse(String text) {
    String responseText;

    if (text.toLowerCase().contains('medical reminder') |
        text.toLowerCase().contains('medicine reminder')) {
      responseText =
          'Medical Reminder feature works by setting reminders for taking medication (tablets/capsules,liquid medicine).You can select time for reminders by enabling the relevant options in the form.';
    } else if (text.toLowerCase().contains('articles')) {
      responseText =
          'The articles in this Application are WHO verified and can be traced to researchs conducted, verified and published';
    } else if (text.toLowerCase().contains('article surfing')) {
      responseText =
          'Article surfing allows you to browse and read articles on a wide variety of topics. Simply enter a search term to get started.';
    } else if (text.toLowerCase().contains('services') |
        text.toLowerCase().contains('products')) {
      responseText =
          '~Our Services~\n 1. Medical reminder\n 2. Article surfing\n 3. Fitness\n 4. Diet Recommender';
    } else if (text.toLowerCase().contains('safety')) {
      responseText =
          '~SOur Services~\n 1. Medical reminder\n 2. Article surfing\n 3. Fitness\n 4. Diet Recommender';
    } else {
      error += 1;
      responseText = (error >= 2)
          ? 'Kindly contact the developer\nemail~ezekielmaina.me@gmail.com'
          : 'I\'m sorry, I didn\'t understand your request. Please choose one of the contextual options from the Services menu.';
      //error = 0;
    }
    return ChatMessage(
      text: responseText,
      isMe: false,
      image: 'assets/robot.jpeg',
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Row(
      mainAxisAlignment:
          message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: CircleAvatar(
            backgroundImage: AssetImage(message.image),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.isMe ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message.text),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          backgroundColor: Colors.blue, // set the background color to green
          automaticallyImplyLeading: true, // remove the back arrow
          actions: [
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () {
                _generateWelcomeMessage();
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.grey],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildMessage(_messages[index]);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _handleSubmit(_textController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
