import 'package:barrage_animation/model/barrage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'barrage_animation_holder.dart';
import 'barrage_animation_item.dart';

class BarrageAnimationPainter extends StatelessWidget {
  const BarrageAnimationPainter({
    Key? key,
    required this.animationHolder,
  }) : super(key: key);

  final BarrageAnimationHolder animationHolder;

  /// When animation execution is completed
  void _onBarrageComplete(BarrageAnimationItem item) {
    animationHolder.removeAnimation(uuid: item.uuid);
  }

  /// Parse BarrageAnimationItem model to Widget list
  List<Widget> getAnimationWidgetList(List<BarrageAnimationItem> animationItemList) {
    return animationItemList
        .map(
          (item) => _AnimationWidget(
            key: Key(item.uuid),
            animationItem: item,
            onComplete: _onBarrageComplete,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BarrageAnimationItem>>(
      stream: animationHolder.animationItemList,
      builder: (context, snapshot) {
        if (!snapshot.hasData || (snapshot.data ?? []).isEmpty) {
          return const SizedBox.shrink();
        }
        final List<BarrageAnimationItem> animationItemList = snapshot.data!.toList();
        return Stack(
          children: [...getAnimationWidgetList(animationItemList)],
        );
      },
    );
  }
}

class _AnimationWidget extends StatefulWidget {
  const _AnimationWidget({
    Key? key,
    required this.animationItem,
    required this.onComplete,
  }) : super(key: key);

  final BarrageAnimationItem animationItem;
  final Function(BarrageAnimationItem) onComplete;

  @override
  State<_AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<_AnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  void _initAnimation() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.animationItem.animatedTime),
      vsync: this,
    );

    // Set offset data for animation
    _offsetAnimation = Tween<Offset>(
      begin: Offset(4.0, widget.animationItem.positionY.toDouble()),
      end: Offset(-1.0, widget.animationItem.positionY.toDouble()),
    ).animate(_animationController);

    // Listen to status of completed
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete(widget.animationItem);
      }
    });

    // Play animation
    _animationController.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final Barrage barrage = widget.animationItem.barrage;

    return SlideTransition(
      position: _offsetAnimation,
      child: SizedBox(
        width: screenWidth / 4,
        height: screenWidth / 4,
        child: barrage.text.isNotEmpty
            ? Text(barrage.text)
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  barrage.imgUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
