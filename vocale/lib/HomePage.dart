import 'package:flutter/material.dart';

import 'EvenOrOddNumberPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _inputController = TextEditingController();
  List<int> _numbers = [];

  void _searchForEvenOrOdd() {
    List<String> inputList = _inputController.text.split(',');
    _numbers = inputList.map((e) => int.tryParse(e.trim()) ?? 0).toList();
    if (_numbers.length < 3) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Zbyt mało liczb"),
            content: Text("Wprowadź co najmniej 3 liczby oddzielone przecinkami."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }
    int evenCount = _numbers.where((element) => element % 2 == 0).length;
    int oddCount = _numbers.length - evenCount;

    int? result = null;
    if (_numbers.any((element) => element is int)) {
      if (evenCount > oddCount) {
        result = _numbers.firstWhere((element) => element % 2 != 0);
      } else {
        result = _numbers.firstWhere((element) => element % 2 == 0);
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
        title: Text('Szukanie liczby odstającej'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Wprowadź liczby oddzielone przecinkami'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchForEvenOrOdd,
              child: Text('Wyszukaj'),
            ),
          ],
        ),
      ),
    );
  }
}
