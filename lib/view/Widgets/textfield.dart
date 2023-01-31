import 'dart:async';

import 'package:ai_bot_chat_application/Controller/chatcontroller.dart';
import 'package:ai_bot_chat_application/Model/chatModel.dart';
import 'package:ai_bot_chat_application/api/apikeys.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.UserString,
  }) : super(key: key);
  // ignore: non_constant_identifier_names
  ChatController TheController = Get.find();
  // ignore: non_constant_identifier_names
  final TextEditingController UserString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Ask your friend',
              ),
            ),
          )),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {
                _sendfunction();
              },
            ),
          )
        ],
      ),
    );
  }

  _sendfunction() async {
    var thetext = UserString.text.trim();
    UserString.clear();
    var newMsg = ChatModel(
      text: thetext,
      sender: 'Sanush',
    );
    TheController.ChatList.add(newMsg);

    final req = CompleteReq(
      prompt: thetext,
      model: kTranslateModelV3,
    );

    TheController.subscription = TheController.theAi!
        .builder(apikey, orgId: "")
        .onCompleteStream(request: req)
        .listen((answer) {
      print(answer!.choices[0].text);

      ChatModel botMsg =
          ChatModel(text: answer.choices[0].text, sender: "Racheal");
      TheController.ChatList.add(botMsg);
    });
  }
}
