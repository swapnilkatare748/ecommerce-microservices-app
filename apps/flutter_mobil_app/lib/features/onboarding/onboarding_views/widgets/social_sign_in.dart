import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/widgets.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.text,
  });

  final VoidCallback onTap;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AppIcon(imagePath), const SizedBox(width: 8), Text(text)],
      ),
    );
  }
}
