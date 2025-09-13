import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellow; // Selected circle color remains yellow
            }
            return const Color(0xFFC3C3C3); // Unselected circle color changed to #C3C3C3
          }),
        ),
      ),
      child: RadioListTile<int>(
        contentPadding: const EdgeInsets.only(left: 0),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Colors.orange,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

