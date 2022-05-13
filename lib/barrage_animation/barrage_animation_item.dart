import '../model/barrage.dart';

class BarrageAnimationItem {
  BarrageAnimationItem({
    required this.uuid,
    required this.positionY,
    required this.animatedTime,
    required this.barrage,
  });

  /// Unique ID
  final String uuid;

  /// Y of position on the screen
  final double positionY;

  /// Time(milliseconds) of animation
  final int animatedTime;

  final Barrage barrage;
}
