import 'package:flutter/material.dart';

class FormSectionHeader extends StatefulWidget {
  final int currentStep;
  final Function(int) onStepTap;

  const FormSectionHeader({
    Key? key,
    required this.currentStep,
    required this.onStepTap,
  }) : super(key: key);

  @override
  State<FormSectionHeader> createState() => _FormSectionHeaderState();
}

class _FormSectionHeaderState extends State<FormSectionHeader> {
  final List<String> steps = [
    'Section 1',
    'Section 2',
    'Section 3',
    'Section 4',
    'Section 5',
    'Section 6',
    'Section 7',
  ];

  @override
  Widget build(BuildContext context) {
    List<int> visibleIndices;

    if (widget.currentStep <= 3) {
      visibleIndices = [0, 1, 2, 3]; // Section 1–4
    } else {
      visibleIndices = [3, 4, 5, 6]; // Section 4–7
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: SizedBox(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: visibleIndices.map((index) {
            final isActive = index == widget.currentStep;
            final label = steps[index];

            return GestureDetector(
              onTap: () => widget.onStepTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 2,
                    width: isActive ? _getTextWidth(context, label) : 0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 14)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }
}
