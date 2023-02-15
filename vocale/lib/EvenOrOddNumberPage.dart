import 'package:flutter/material.dart';

class EvenOrOddNumberPage extends StatelessWidget {
  final int result;

  EvenOrOddNumberPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Znaleziona liczba odstająca'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Znaleziona liczba odstająca - ${result != null ? (result % 2 == 0 ? 'parzysta' : 'nieparzysta') : 'brak'} to:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            child: Text('$result', style: TextStyle(fontSize: 60)),
          )
        ],
      ),
    );
  }
}
