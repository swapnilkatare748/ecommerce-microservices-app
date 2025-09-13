import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonBounceAnimation extends StatefulWidget {
  const ButtonBounceAnimation({
    super.key,
    required this.child,
    required this.onPressed,
    this.shouldSupportEnterKey = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool shouldSupportEnterKey;

  @override
  State<ButtonBounceAnimation> createState() => _ButtonBounceAnimationState();
}

class _ButtonBounceAnimationState extends State<ButtonBounceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bounceAnimationController;
  late final Animation<double> _buttonSizeScale;
  late final _focusNode = FocusNode();
  late Completer _animationCompleter = Completer();

  @override
  void initState() {
    super.initState();

    _bounceAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _buttonSizeScale =
        Tween<double>(begin: 1.0, end: 0.97).animate(CurvedAnimation(
      parent: _bounceAnimationController,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  void didUpdateWidget(covariant ButtonBounceAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimationController,
      builder: (_, Widget? child) {
        return Transform.scale(
          scale: _buttonSizeScale.value,
          child: child!,
        );
      },
      // Need this way only till now
      child: GestureDetector(
        onTapDown: (_) => _forwardAnimation(),
        onTapUp: (_) => _callOnPressed(),
        onTapCancel: () => _reverseAnimation(),
        child: widget.shouldSupportEnterKey
            ? Focus(
                focusNode: _focusNode,
                onKeyEvent: (FocusNode node, KeyEvent event) {
                  if (event.logicalKey == LogicalKeyboardKey.enter &&
                      event is KeyDownEvent) {
                    _callOnPressed(); // Call your function when Enter is pressed
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }

  void _forwardAnimation() {
    if (widget.onPressed != null) {
      try {
        return _animationCompleter
            .complete(_bounceAnimationController.forward());
      } catch (_) {
        // Sometimes tapping two times at same time gives error so, specially on emulator when its not in focus
        widget.onPressed?.call();
        _animationCompleter = Completer();
        debugPrint(
          "roptia_ui_kit: _forwardAnimation() failed on button tap.\n Can be ignored as it is handled and then logged.",
        );
      }
    }
  }

  Future _reverseAnimation() async {
    if (mounted) {
      await _animationCompleter.future;
      _animationCompleter = Completer();
      await _bounceAnimationController.reverse();
    }
  }

  Future _callOnPressed() async {
    await _reverseAnimation();
    return widget.onPressed?.call();
  }

  @override
  void dispose() {
    _bounceAnimationController.dispose();
    if (widget.shouldSupportEnterKey) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}
