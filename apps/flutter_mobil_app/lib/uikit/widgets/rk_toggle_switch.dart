import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ToggleSwitch extends StatelessWidget {
  final String title;
  final String subtitle; // Already included in your code
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4), // Space between title and subtitle
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70, // Slightly lighter white for subtitle
                  fontSize: 14, // Smaller font size for subtitle
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 61.99999237060547, // Width as specified previously
          height: 22.04444122314453, // Height as specified previously
          child: Transform.scale(
            scale: 0.7, // Adjust scale to fit the Switch within the SizedBox
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFFFF6200), // Orange track when "on"
              activeThumbImage: null,
              inactiveThumbColor: const Color(0xFFFF6200), // Orange thumb when "off"
              activeTrackColor: const Color(0xFFFF6200), // Orange track when "on"
              inactiveTrackColor: Colors.white, // White track when "off"
              thumbColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white; // White thumb when "on"
                }
                return const Color(0xFFFF6200); // Orange thumb when "off"
              }),
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const Color(0xFFFF6200); // Orange track when "on"
                }
                return Colors.white; // White track when "off"
              }),
            ),
          ),
        ),
      ],
    );
  }
}