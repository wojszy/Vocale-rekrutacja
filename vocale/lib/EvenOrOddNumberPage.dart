import 'package:flutter/material.dart';
import 'package:vocale/messages.dart';

class EvenOrOddNumberPage extends StatelessWidget {
  final int result;

  EvenOrOddNumberPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Messages.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                Text(
                  Messages.resultText,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  child: Text('$result', style: TextStyle(fontSize: 60)),
                )
              ],
            ),
          ),
        ));
  }
}
