import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final String type;
  const Quiz({super.key, required this.type});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int q = 0, score = 0, selected = -1;
  bool answered = false;

  final animals = [
    [
      '🦁',
      'Who is the King of the Jungle?',
      ['Lion', 'Cat', 'Dog', 'Cow'],
      'Lion',
      'Lions live in groups!',
    ],
    [
      '🐘',
      'Who has a long trunk?',
      ['Dog', 'Elephant', 'Horse', 'Cat'],
      'Elephant',
      'Elephants are very big!',
    ],
    [
      '🦒',
      'Who has a long neck?',
      ['Lion', 'Giraffe', 'Zebra', 'Panda'],
      'Giraffe',
      'Giraffes are very tall!',
    ],
    [
      '🐧',
      'Who can swim but cannot fly?',
      ['Eagle', 'Penguin', 'Owl', 'Parrot'],
      'Penguin',
      'Penguins are great swimmers!',
    ],
    [
      '🐍',
      'Who has no legs?',
      ['Snake', 'Frog', 'Dog', 'Horse'],
      'Snake',
      'Snakes have no legs!',
    ],
    [
      '🦓',
      'Who has black and white stripes?',
      ['Horse', 'Zebra', 'Cow', 'Tiger'],
      'Zebra',
      'Every zebra has special stripes!',
    ],
    [
      '🐼',
      'Who loves bamboo?',
      ['Panda', 'Lion', 'Tiger', 'Bear'],
      'Panda',
      'Pandas love bamboo!',
    ],
    [
      '🐬',
      'Who lives in the ocean?',
      ['Dolphin', 'Cow', 'Dog', 'Horse'],
      'Dolphin',
      'Dolphins are smart!',
    ],
    [
      '🦊',
      'Who has a bushy tail?',
      ['Fox', 'Cow', 'Fish', 'Elephant'],
      'Fox',
      'Foxes are clever animals!',
    ],
    [
      '🐨',
      'Who eats eucalyptus leaves?',
      ['Koala', 'Tiger', 'Rabbit', 'Lion'],
      'Koala',
      'Koalas love trees!',
    ],
  ];

  final fruits = [
    [
      '🍌',
      'Which fruit is yellow?',
      ['Apple', 'Banana', 'Orange', 'Grape'],
      'Banana',
      'Bananas are yummy!',
    ],
    [
      '🍉',
      'Which fruit is green outside?',
      ['Mango', 'Apple', 'Watermelon', 'Pear'],
      'Watermelon',
      'Watermelon has lots of water!',
    ],
    [
      '🍎',
      'Which fruit can be red or green?',
      ['Apple', 'Banana', 'Coconut', 'Papaya'],
      'Apple',
      'Apples are healthy!',
    ],
    [
      '🥭',
      'Which fruit is tropical?',
      ['Mango', 'Grape', 'Pear', 'Lemon'],
      'Mango',
      'Mangoes are sweet!',
    ],
    [
      '🍊',
      'Which fruit has Vitamin C?',
      ['Orange', 'Banana', 'Apple', 'Grape'],
      'Orange',
      'Oranges have Vitamin C!',
    ],
    [
      '🍓',
      'Which fruit is small and red?',
      ['Strawberry', 'Banana', 'Mango', 'Coconut'],
      'Strawberry',
      'Strawberries are tasty!',
    ],
    [
      '🍍',
      'Which fruit has a spiky outside?',
      ['Pineapple', 'Apple', 'Grape', 'Orange'],
      'Pineapple',
      'Pineapples are tropical!',
    ],
    [
      '🥝',
      'Which fruit is green inside?',
      ['Kiwi', 'Apple', 'Banana', 'Pear'],
      'Kiwi',
      'Kiwis are rich in Vitamin C!',
    ],
    [
      '🍇',
      'Which fruit grows in bunches?',
      ['Grapes', 'Apple', 'Mango', 'Watermelon'],
      'Grapes',
      'Grapes can be green or purple!',
    ],
    [
      '🥥',
      'Which fruit has a hard shell?',
      ['Coconut', 'Banana', 'Orange', 'Grape'],
      'Coconut',
      'Coconuts have white flesh!',
    ],
  ];

  List get data => widget.type == 'Animal' ? animals : fruits;

  void answer(int i) {
    if (answered) return;

    setState(() {
      selected = i;
      answered = true;
      if (data[q][2][i] == data[q][3]) score++;
    });
  }

  void next() {
    if (q < data.length - 1) {
      setState(() {
        q++;
        selected = -1;
        answered = false;
      });
    } else {
      result();
    }
  }

  void result() {
    String title = score == 10
        ? '🏆 Perfect!'
        : score >= 7
        ? '🌟 Great Job!'
        : score >= 5
        ? '😊 Good Work!'
        : '💪 Keep Trying!';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Center(child: Text(title)),
        content: Text(
          '🎉\n\nYour Score\n$score / 10',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('DONE'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = data[q];

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        title: Text('${widget.type} Quiz'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (q + 1) / data.length,
              minHeight: 9,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${q + 1}/10',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '⭐ $score',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(item[0], style: const TextStyle(fontSize: 65)),
                  const SizedBox(height: 10),
                  Text(
                    item[1],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            ...List.generate(4, (i) => button(item[2][i], i)),

            if (answered) ...[
              const SizedBox(height: 5),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('💡 ${item[4]}', textAlign: TextAlign.center),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: next,
                  child: Text(q == 9 ? '🎉 SEE RESULT' : '➡️ NEXT'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget button(String text, int i) {
    bool correct = text == data[q][3];
    bool chosen = selected == i;

    Color color = Colors.white;

    if (answered && correct) {
      color = Colors.green.shade100;
    } else if (answered && chosen) {
      color = Colors.red.shade100;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 9),
      child: OutlinedButton(
        onPressed: answered ? null : () => answer(i),
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Text(
              '${String.fromCharCode(65 + i)}.',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (answered && correct)
              const Icon(Icons.check_circle, color: Colors.green),
            if (answered && chosen && !correct)
              const Icon(Icons.cancel, color: Colors.red),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
