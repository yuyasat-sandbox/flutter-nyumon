import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '_animationController\n.value =',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              '1.00',
              style: TextStyle(
                fontSize: 64,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.play_arrow),
                    Text(
                      '再生',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: Icon(Icons.play_arrow),
                    ),
                    Text(
                      '逆再生',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: Icon(Icons.pause),
                    ),
                    Text(
                      '一時停止',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.stop),
                    Text(
                      '停止',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.repeat),
                    Text(
                      'リピート',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Duration',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(value: null, groupValue: null, onChanged: null),
                const Text('15秒'),
                Radio(value: null, groupValue: null, onChanged: null),
                const Text('30秒'),
                Radio(value: null, groupValue: null, onChanged: null),
                const Text('60秒'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
