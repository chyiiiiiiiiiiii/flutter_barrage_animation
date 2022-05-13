import 'package:flutter/material.dart';

import '../barrage_animation/barrage_animation_holder.dart';
import '../barrage_animation/barrage_animation_view.dart';
import '../model/barrage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BarrageAnimationHolder animationHolder = BarrageAnimationHolder();

  /// new barrage-item for animation view
  void _addBarrage({required bool showText}) {
    final Barrage barrage = Barrage();
    if (showText) {
      barrage.text = 'hello';
    } else {
      barrage.imgUrl =
          'https://scontent-tpe1-1.xx.fbcdn.net/v/t1.6435-9/175162645_5959624317396939_1564738804145256135_n.jpg?_nc_cat=110&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=II_4RHuuZwcAX8wH95b&_nc_ht=scontent-tpe1-1.xx&oh=00_AT_mrw3A094L0zN2ba9s_KeAGBxam3es19t-U_-PiWkQFw&oe=62A10D0E';
    }
    animationHolder.addAnimation(barrage: barrage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
              child: Text(
            'Barrage animation!',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 24.0,
            ),
          )),
          BarrageAnimationView(animationHolder: animationHolder),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.large(
            onPressed: () => _addBarrage(showText: true),
            heroTag: 'text',
            child: const Text('Text'),
          ),
          FloatingActionButton.large(
            onPressed: () => _addBarrage(showText: false),
            heroTag: 'image',
            child: const Text('Image'),
          ),
        ],
      ),
    );
  }
}
