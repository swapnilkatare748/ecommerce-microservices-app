import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return null; // No border when selected (uses activeColor)
            }
            return const BorderSide(
              color: Color(0xFFC3C3C3), // Unselected border color set to #C3C3C3
              width: 2, // Default border width, can adjust if needed
            );
          }),
        ),
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.orange,
        checkColor: Colors.white54,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

