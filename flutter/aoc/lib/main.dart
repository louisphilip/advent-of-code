import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advent of Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<AdventDay> days = [
    AdventDay('Day 1', 'A gift of hope'),
    AdventDay('Day 2', 'A gift of peace'),
    AdventDay('Day 3', 'A gift of love'),
    AdventDay('Day 4', 'A gift of joy'),
    AdventDay('Day 5', 'A gift of sharing'),
    AdventDay('Day 6', 'A gift of kindness'),
    AdventDay('Day 7', 'A gift of patience'),
    AdventDay('Day 8', 'A gift of forgiveness'),
    AdventDay('Day 9', 'A gift of humility'),
    AdventDay('Day 10', 'A gift of gratitude'),
    AdventDay('Day 11', 'A gift of generosity'),
    AdventDay('Day 12', 'A gift of compassion'),
    AdventDay('Day 13', 'A gift of understanding'),
    AdventDay('Day 14', 'A gift of forgiveness'),
    AdventDay('Day 15', 'A gift of love'),
    AdventDay('Day 16', 'A gift of hope'),
    AdventDay('Day 17', 'A gift of peace'),
    AdventDay('Day 18', 'A gift of joy'),
    AdventDay('Day 19', 'A gift of sharing'),
    AdventDay('Day 20', 'A gift of kindness'),
    AdventDay('Day 21', 'A gift of patience'),
    AdventDay('Day 22', 'A gift of forgiveness'),
    AdventDay('Day 23', 'A gift of humility'),
    AdventDay('Day 24', 'A gift of gratitude'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advent of Code Calendar'),
      ),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(days[index].title),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(days[index].message),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AdventDay {
  final String title;
  final String message;

  AdventDay(this.title, this.message);
}
