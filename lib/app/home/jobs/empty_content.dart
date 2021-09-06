import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyContent(
      {Key? key,
      this.title = 'Nothing here',
      this.message = 'Add a new item to get started'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
