import 'package:flutter/material.dart';
import 'dart:math';
import 'dice.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dice',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 0;
  int right = 0;
  int leftDiceNumber = 6;
  int rightDiceNumber = 6;
  void numChange() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  String winStatement() {
    if (leftDiceNumber > rightDiceNumber) {
      setState(() {
        left++;
      });
      return 'You Win!';
    } else if (leftDiceNumber < rightDiceNumber) {
      setState(() {
        right++;
      });
      return 'Maruf Wins!';
    } else
      return 'Draw!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Press the dice',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                winStatement(),
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'You',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              Text(
                'Maruf',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: _scaledPadding(context),
                  child: DiceWithButton(
                    image: 'images/dice$rightDiceNumber.png',
                    onPressed: () {
                      numChange();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: _scaledPadding(context),
                  child: DiceWithButton(
                    image: 'images/dice$rightDiceNumber.png',
                    onPressed: () {
                      numChange();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You: $left\nMaruf:$right',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  EdgeInsetsGeometry _scaledPadding(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double defaultFontSize = theme.textTheme.labelLarge?.fontSize ?? 14.0;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0;
    return ButtonStyleButton.scaledPadding(
      theme.useMaterial3
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
          : const EdgeInsets.all(8),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      effectiveTextScale,
    );
  }
}
