import 'package:flutter/material.dart';
class FavoriteAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallFav;
  const FavoriteAnimation({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    required this.onEnd,
    this.smallFav = false,
  }) : super(key: key);

  @override
  State<FavoriteAnimation> createState() => _FavoriteAnimationState();
}

class _FavoriteAnimationState extends State<FavoriteAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds:widget.duration.inMilliseconds ~/ 2,
    ),
    );
    scale = Tween<double>(begin: 1,end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant FavoriteAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.isAnimating != oldWidget.isAnimating){
      startAnimation();
    }
  }

  startAnimation() async{
    if(widget.isAnimating || widget.smallFav ) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(const Duration(milliseconds: 200,),);

      if(widget.onEnd != null){
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scale,
        child: widget.child,
    );
  }
}
