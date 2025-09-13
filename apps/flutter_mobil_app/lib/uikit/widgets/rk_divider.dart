import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKDivider extends StatelessWidget {
  const RKDivider({
    super.key,
    this.color = AppColors.divider1,
    this.thickness = 1,
    this.margin,
    this.canExtendFull = false,
  });

  final Color color;
  final double thickness;
  final EdgeInsets? margin;
  final bool canExtendFull;

  @override
  Widget build(BuildContext context) {
    if (canExtendFull) {
      return IntrinsicHeight(
        child: OverflowBox(
          minHeight: thickness,
          maxWidth: MediaQuery.sizeOf(context).width,
          child: _buildDivider(),
        ),
      );
    } else {
      return _buildDivider();
    }
  }

  Widget _buildDivider() {
    return Container(
      color: color,
      height: thickness,
      margin: margin,
    );
  }
}
