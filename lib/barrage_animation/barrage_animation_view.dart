import 'package:flutter/material.dart';

import 'barrage_animation_holder.dart';
import 'barrage_animation_painter.dart';

class BarrageAnimationView extends StatelessWidget {
  const BarrageAnimationView({
    Key? key,
    required this.animationHolder,
  }) : super(key: key);

  final BarrageAnimationHolder animationHolder;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SafeArea(
            child: BarrageAnimationPainter(animationHolder: animationHolder),
          ),
        ),
      ),
    );
  }
}
