import 'package:flutter/material.dart';

/// A widget that delays and animates its child using both fade and slide transitions
class DelayedAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset beginOffset;

  const DelayedAnimatedWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero, 
    this.beginOffset = const Offset(0, 0.2),
  });

  @override
  State<DelayedAnimatedWidget> createState() => _DelayedAnimatedWidgetState();
}

class _DelayedAnimatedWidgetState extends State<DelayedAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
