import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  Xylophone({super.key});

  final List<Map<String, dynamic>> buttonConfigs = [
    {'color': Colors.red, 'noteNumber': 1},
    {'color': Colors.orange, 'noteNumber': 2},
    {'color': Colors.yellow, 'noteNumber': 3},
    {'color': Colors.green, 'noteNumber': 4},
    {'color': Colors.cyan, 'noteNumber': 5},
    {'color': Colors.blue, 'noteNumber': 6},
    {'color': Colors.purple, 'noteNumber': 7}
  ];

  Future<void> playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$noteNumber.wav'));
    await player.resume();
  }

  Widget buildKey(Color color, int noteNumber) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(noteNumber);
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttonConfigs
                .map(
                    (config) => buildKey(config['color'], config['noteNumber']))
                .toList(),
          ),
        ),
      ),
    );
  }
}
