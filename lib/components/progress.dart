// TODO Implement this library.
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;
  Progress({this.message = 'loading'});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(message),
          )
        ],
      ),
    );
  }
}
