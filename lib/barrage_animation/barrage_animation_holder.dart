import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../model/barrage.dart';
import 'barrage_animation_item.dart';

class BarrageAnimationHolder {
  /// List about display animation item
  BehaviorSubject<List<BarrageAnimationItem>> animationItemList =
      BehaviorSubject<List<BarrageAnimationItem>>.seeded([]);

  /// Add animation item to the list
  Future<void> addAnimation({
    required Barrage barrage,
  }) async {
    final List<BarrageAnimationItem> tempList = animationItemList.value;

    // UUID of per animation
    final String uuid = const Uuid().v4();
    // y of position of animation-item
    final double randomPositionY = Random().nextDouble() * 5;
    // Time of animation
    const int animatedTime = 1500;

    // add item to list
    final item = BarrageAnimationItem(
      uuid: uuid,
      positionY: randomPositionY,
      animatedTime: animatedTime,
      barrage: barrage,
    );
    tempList.add(item);
    animationItemList.add(tempList);

    debugPrint('addAnimation - ${animationItemList.value.length}');
  }

  /// Remove animation item from the list
  void removeAnimation({required String uuid}) {
    final List<BarrageAnimationItem> tempList = animationItemList.value;
    tempList.removeWhere((element) => element.uuid == uuid);
    animationItemList.add(tempList);

    debugPrint('removeAnimation - ${animationItemList.value.length}');
  }
}
