import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SharedAxisTransitionPage extends StatefulWidget {
  @override
  _SharedAxisTransitionPageState createState() =>
      _SharedAxisTransitionPageState();
}

class _SharedAxisTransitionPageState extends State<SharedAxisTransitionPage> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isCatImage = true;

  void _toggleImage() {
    setState(() {
      _isCatImage = !_isCatImage;
    });
  }

  void _updateTransitionType(SharedAxisTransitionType newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 800),
                reverse: !_isCatImage,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimiation,
                ) =>
                    SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimiation,
                  transitionType: _transitionType,
                ),
                child: _isCatImage ? _CatImage() : _DogImage(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                onPrimary: Colors.black,
              ),
              onPressed: _toggleImage,
              child: const Text('切り替える'),
            ),
            const Divider(thickness: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.horizontal,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue!);
                  },
                ),
                const Text('X'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.vertical,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue!);
                  },
                ),
                const Text('Y'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.scaled,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue!);
                  },
                ),
                const Text('Z'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CatImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                  'https://images.pexels.com/photos/1770918/pexels-photo-1770918.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'これは猫です。',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DogImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                  'https://images.pexels.com/photos/4681107/pexels-photo-4681107.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'これは犬です。',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
