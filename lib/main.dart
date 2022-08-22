import 'package:demo_share_preferences/card_model.dart';
import 'package:demo_share_preferences/sprefs_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo SharedPreferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  Color _currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => _currentColor = color);
  }

  List<Widget> cardWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();

    _getCardList();
  }

  void _getCardList() async {
    final List<CardModel> cards = await SPrefData.getList();
    setState(() {
      cardWidgets = cards
          .map(
            (card) => Card(
              child: ListTile(
                title: Text(
                  card.title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                tileColor: Color(card.color),
                subtitle: Text(
                  DateFormat('dd-MM-yyyy HH:mm').format(card.dateTime),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteCard(card);
                  },
                ),
              ),
            ),
          )
          .toList();
    });
  }

  void _saveCard(CardModel card) async {
    await SPrefData.addCardToList(card);
    _getCardList();
  }

  void _deleteCard(CardModel card) async {
    await SPrefData.removeCardFromList(card);
    _getCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo SharedPreferences"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Card Title',
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.color_lens,
                  color: _currentColor,
                  size: 48.0,
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    SPrefData.removeList();
                    cardWidgets = [];
                  });
                },
                child: const Text("Clear All"),
              ),
              ElevatedButton(
                onPressed: () {
                  final CardModel card = CardModel(
                    title: _controller.text,
                    color: _currentColor.value,
                    dateTime: DateTime.now(),
                  );

                  _saveCard(card);
                },
                child: const Text("Save to SharedPreferences"),
              ),
              Expanded(
                child: ListView(children: cardWidgets),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
