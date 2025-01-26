import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MessageBubble extends StatelessWidget {
  final String? message, sender;
  final bool? isMe;
  const MessageBubble({super.key, this.message, this.sender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe!? Alignment.centerRight:Alignment.centerLeft,
        child: Material(
          borderRadius: BorderRadius.only(
            topLeft:isMe!? Radius.circular(bubbleRedius): Radius.circular(0),
            topRight: isMe!? Radius.circular(0) : Radius.circular(bubbleRedius),
            bottomLeft: Radius.circular(bubbleRedius),
            bottomRight: Radius.circular(bubbleRedius),
          ) ,
          color:isMe! ? kSendButtonColor: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: isMe!? CrossAxisAlignment.end :CrossAxisAlignment.start,
              children: [
                Text(
                  sender!,
                  style: TextStyle(fontSize: 12, color: kChatEmailColor),
                ),
                SizedBox(height: 8,),
                Text(
                  message!,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}