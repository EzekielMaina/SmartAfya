import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int _dice1 = 1;
  int _dice2 = 1;
  int _predictedSum = 7;
  int _actualSum = 0;
  bool _resultShown = false;

  void _rollDice() {
    setState(() {
      _dice1 = Random().nextInt(6) + 1;
      _dice2 = Random().nextInt(6) + 1;
      _actualSum = _dice1 + _dice2;
      _resultShown = true;
    });
  }

  void _resetGame() {
    setState(() {
      _predictedSum = 7;
      _actualSum = 0;
      _resultShown = false;
    });
  }

  void _checkResult() {
    if (_actualSum == _predictedSum) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You got it right!'),
          actions: [
            TextButton(
              onPressed: _resetGame,
              child: Text('Play Again'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ooops, Try Again'),
          content: Text('You predicted $_predictedSum but got $_actualSum'),
          actions: [
            TextButton(
              onPressed: _resetGame,
              child: Text('Play Again'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/dice$_dice1.png', height: 100),
                Image.asset('assets/dice$_dice2.png', height: 100),
              ],
            ),
            const SizedBox(height: 16),
            _resultShown
                ? Text(
                    'You predicted $_predictedSum, got $_actualSum',
                    style: TextStyle(fontSize: 20),
                  )
                : TextFormField(
                    initialValue: '7',
                    decoration: InputDecoration(
                      hintText: 'Enter your prediction',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _predictedSum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Roll Dice'),
            ),
            const SizedBox(height: 16),
            _resultShown
                ? ElevatedButton(
                    onPressed: _resetGame,
                    child: Text('Play Again'),
                  )
                : ElevatedButton(
                    onPressed: _checkResult,
                    child: Text('Check Result'),
                  ),
          ],
        ),
      ),
    );
  }
}
