import 'package:flutter/material.dart';
import '../../../uikit/utils/rk_preview_type_enum.dart';

class FeedbackPreviewWidget extends StatelessWidget {
  final FeedbackType type;

  const FeedbackPreviewWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Preview", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 12),
        switch (type) {
          FeedbackType.ratings => buildStarPreview(),
          FeedbackType.likert => buildLikertPreview(),
          FeedbackType.nps => buildNpsPreview(),
          FeedbackType.emojiSlider => buildEmojiSliderPreview(),
        }
      ],
    );
  }

  Widget buildStarPreview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(Icons.star, color: Colors.amber.shade300, size: 36);
      }),
    );
  }

  Widget buildLikertPreview() {
    final labels = ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"];
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      children: labels.map((e) {
        return Chip(
          label: Text(e, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue.shade300,
          side: BorderSide.none, // Removes the border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Optional: softer edges
          ),
        );
      }).toList(),
    );
  }

  Widget buildNpsPreview() {
    return Wrap(
      spacing: 8,
      children: List.generate(11, (index) {
        return CircleAvatar(
          backgroundColor: Colors.white24,
          child: Text('$index', style: const TextStyle(color: Colors.white)),
        );
      }),
    );
  }

  Widget buildEmojiSliderPreview() {
    final emojis = ["😡", "😕", "😐", "🙂", "😍"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojis.map((emoji) {
        return Text(emoji, style: const TextStyle(fontSize: 30));
      }).toList(),
    );
  }
}
