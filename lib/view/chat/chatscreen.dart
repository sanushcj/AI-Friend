import 'package:ai_bot_chat_application/Controller/chatcontroller.dart';
import 'package:ai_bot_chat_application/Model/chatModel.dart';
import 'package:ai_bot_chat_application/view/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController userString = TextEditingController();
   ChatController TheController = Get.put(ChatController());




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI Friend'),centerTitle: true,backgroundColor: Colors.purple[400],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple,
          child: Column(
            children: [
              Obx(
                () =>Flexible(
                    child: ListView.separated(
                        itemBuilder: (context, index) => ChatModel(text: TheController.ChatList[index].text,sender: TheController.ChatList[index].sender, index: index, ),
                        separatorBuilder: (context, index) =>
                            (const SizedBox(height: 20)),
                        itemCount: TheController.ChatList.length)),
              ),
              MyTextField(UserString: userString),
            ],
          ),
        ),
      ),
    );
  }
}

