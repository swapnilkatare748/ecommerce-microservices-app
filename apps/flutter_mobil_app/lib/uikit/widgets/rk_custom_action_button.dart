import 'package:flutter/material.dart';
class CustomActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Color backgroundColor;
  final double fontSize;
  final double borderRadius;
  const CustomActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.backgroundColor = Colors.orange,
    this.fontSize = 16,
    this.borderRadius = 12, // From Figma
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 109, // Figma width
        height: 48, // Figma height
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isEnabled ? backgroundColor : Colors.grey.shade400,
            padding: const EdgeInsets.symmetric(
              horizontal: 21, // Left/Right padding from Figma
              vertical: 11,  // Top/Bottom padding from Figma
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: fontSize),
              ),
              const SizedBox(width: 5), // gap from Figma
              const Icon(Icons.arrow_forward, size: 20, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
