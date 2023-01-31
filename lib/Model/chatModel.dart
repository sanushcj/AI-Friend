import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatModel extends StatelessWidget {
  ChatModel({super.key, required this.text, required this.sender, this.index});

  String sender, text;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          backgroundImage:  sender == 'Racheal' ?   const AssetImage(
         'lib/Asset/img/bot_profile_Picture.jpg' ,
          ) : const AssetImage(
       'lib/Asset/img/panda.jpeg' ,
          ) 
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                sender,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.5,
               child: Text(text,style: const TextStyle(fontSize: 15),overflow: TextOverflow.visible ,)),
            ],
          ),
        )
      ],
    );
  }
}
