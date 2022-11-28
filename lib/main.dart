import 'package:flash_cards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'flashcard.dart';

void main() {
  runApp(const FlashCards());
}

class FlashCards extends StatefulWidget {
  const FlashCards({super.key});

  @override
  State<FlashCards> createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  final List<Flashcard> _flashcards = [
    Flashcard(question: "Is this question 1?", answer: "Yes"),
    Flashcard(question: "Is this question 3?", answer: "No"),
    Flashcard(question: "Is this question 3?", answer: "Yes"),
    Flashcard(question: "Is this question 4?", answer: "Yes"),
    Flashcard(question: "Is this question 5?", answer: "Yes"),
    Flashcard(question: "Is this question 6?", answer: "Yes"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front: FlashcardView(
                        text: _flashcards[_currentIndex].question),
                    back:
                        FlashcardView(text: _flashcards[_currentIndex].answer),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          _currentIndex >= 1 ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
