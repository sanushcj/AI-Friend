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
            child: SizedBox(
                height: 55,
                child: CupertinoTextField(
                  controller: UserString,
                )),
          ),
          IconButton(
              onPressed: () {
                _sendfunction();
              },
              icon: const CircleAvatar(radius: 50, child: Icon(Icons.send)))
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
                  

    TheController.subscription =  TheController.theAi!
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
