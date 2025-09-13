import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';


void showFeedbackFollowupBottomSheet({
  required BuildContext context,
  required String followUpQuestion,
  required List<String> options,
  required ValueChanged<String> onOptionSelected,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const RKPaddings.h16v24(),
        decoration: const BoxDecoration(
          color: Color(0xFFF4EBD0),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            // Question title
            RKText(
              followUpQuestion,
              style: RKTextStyle.paragraph4,
              color: const Color(0xFF5A4E3C),
              fontWeight: FontWeight.bold,
            ),
            const RKSizedBox.h16(),

            // Option buttons
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(options.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    onOptionSelected(options[index]);
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const RKPaddings.h16v10(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFBBAA90), width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      options[index],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5A4E3C),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const RKSizedBox.h20(),
          ],
        ),
      );
    },
  );
}




// void showFeedbackFollowupBottomSheet({
//   required BuildContext context,
//   required List<String> options,
//   required VoidCallback onOptionSelected,
// }) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (context) {
//       return Container(
//         padding: const RKPaddings.h16v24(),
//         decoration: const BoxDecoration(
//           color: Color(0xFFF4EBD0),
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: 40,
//                 height: 4,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[400],
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//             const RKText(
//               "Feedback Type",
//               style: RKTextStyle.paragraph4,
//               color: Color(0xFF5A4E3C),
//               fontWeight: FontWeight.bold,
//             ),
//             const RKSizedBox.h16(),
//
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: List.generate(options.length, (index) {
//                 return InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                     onOptionSelected();
//                   },
//                   borderRadius: BorderRadius.circular(30),
//                   child: Container(
//                     padding: const RKPaddings.h16v10(),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: const Color(0xFFBBAA90), width: 1),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Text(
//                       options[index],
//                       style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF5A4E3C),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             const RKSizedBox.h20(),
//           ],
//         ),
//       );
//     },
//   );
// }
