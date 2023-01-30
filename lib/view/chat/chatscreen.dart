import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  TextEditingController UserString = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple,
          child: Column(
            children: [
              Flexible(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                            height: 10,
                            color: Colors.green,
                          ),
                      separatorBuilder: (context, index) =>
                          (const SizedBox(height: 20)),
                      itemCount: 10)),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 55,
                        child: CupertinoTextField(
                          controller: UserString,
                        )),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                          radius: 50, child: Icon(Icons.send)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
