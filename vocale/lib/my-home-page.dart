import 'package:flutter/material.dart';
import 'package:vocale/messages-text.dart';

import 'even-or-odd-number-page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();
  List<int> numbers = [];

  void searchForEvenOrOdd() {
    List<String> inputList = inputController.text.split(',');
    numbers = inputList.map((e) => int.tryParse(e.trim()) ?? 0).toList();
    if (numbers.length < 3) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(MessagesText.alertTitle),
            content: Text(MessagesText.alertText),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(MessagesText.alertButton),
              ),
            ],
          );
        },
      );

      return;
    }
    int evenCount = numbers.where((element) => element % 2 == 0).length;
    int oddCount = numbers.length - evenCount;

    int? result = null;
    if (numbers.any((element) => element is int)) {
      if (evenCount != 0 && oddCount != 0) {
        if (evenCount > oddCount) {
          result = numbers.firstWhere((element) => element % 2 != 0);
        } else {
          result = numbers.firstWhere((element) => element % 2 == 0);
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(MessagesText.checkTitle),
              content: Text(MessagesText.checkText),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(MessagesText.alertButton),
                ),
              ],
            );
          },
        );
        return;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EvenOrOddNumberPage(result!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MessagesText.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: MessagesText.inputText, contentPadding: EdgeInsets.all(20.0)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: searchForEvenOrOdd,
              child: Text(MessagesText.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
