import 'package:flutter/material.dart';

class MsgBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  final String time;

  const MsgBubble({
    Key? key,
    required this.text,
    required this.sender,
    required this.time,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '${sender.split("@").first} ',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Material(
            elevation: 2,
            shadowColor: Colors.black54,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: isMe
                ? BorderRadius.circular(30).copyWith(bottomRight: const Radius.circular(0))
                : BorderRadius.circular(30).copyWith(topLeft: const Radius.circular(0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            time.substring(11, 16),
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
