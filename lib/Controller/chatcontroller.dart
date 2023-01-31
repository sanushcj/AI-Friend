import 'dart:async';

import 'package:ai_bot_chat_application/Model/chatModel.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get.dart';
class ChatController extends GetxController  {
  var ChatList = <ChatModel> [].obs;

ChatGPT? theAi;
StreamSubscription? subscription;

@override
  void onInit() {
    super.onInit();
    theAi = ChatGPT.instance;
  }

  @override
  void dispose() {
subscription!.cancel();
    super.dispose();
  }
}