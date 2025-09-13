import 'package:flutter/material.dart';

class RKStepProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double height;
  final Color completedColor;
  final Color incompleteColor;
  final double spacing;
  final EdgeInsetsGeometry padding;

  const RKStepProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.height = 4,
    this.completedColor = Colors.white,
    this.incompleteColor = Colors.white30,
    this.spacing = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index.isOdd) {
            return SizedBox(width: spacing);
          }
          int stepIndex = index ~/ 2;
          bool isCompleted = stepIndex < currentStep;
          return Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: isCompleted ? completedColor : incompleteColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
