import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioCache audioCache = AudioCache();

  void playSound(int soundNumber) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({
    required Color color,
    required int soundNumber,
  }) {
    return GestureDetector(
      onTap: () {
        playSound(soundNumber);
      },
      child: Container(
        color: color, // Fixed height for all keys.
        width: 40,
        height: 300,
        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'readme-asset/1.png',
                height: 400,
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildKey(color: Colors.red, soundNumber: 1),
                  buildKey(color: Colors.orange, soundNumber: 2),
                  buildKey(color: Colors.yellow, soundNumber: 3),
                  buildKey(color: Colors.green, soundNumber: 4),
                  buildKey(color: Colors.teal, soundNumber: 5),
                  buildKey(color: Colors.blue, soundNumber: 6),
                  buildKey(color: Colors.purple, soundNumber: 7),
                  buildKey(color: Colors.greenAccent, soundNumber: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
