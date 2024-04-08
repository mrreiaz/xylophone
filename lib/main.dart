import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioCache audioCache = AudioCache();

  void playSound(int soundNumber) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey(
      {required Color color,
      required int soundNumber,
      required double height}) {
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
          child: Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'readme-asset/1.png',
                        height: 400,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),
                    buildKey(
                      color: Colors.red,
                      soundNumber: 1,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.orange,
                      soundNumber: 2,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.yellow,
                      soundNumber: 3,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.green,
                      soundNumber: 4,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.teal,
                      soundNumber: 5,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.blue,
                      soundNumber: 6,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.purple,
                      soundNumber: 7,
                      height: MediaQuery.of(context).size.width,
                    ),
                    buildKey(
                      color: Colors.white,
                      soundNumber: 8,
                      height: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
