import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';
import '../widgets/hotel_feedback_data.dart';

class EmojiLikertFeedbackScreen extends StatefulWidget {
  const EmojiLikertFeedbackScreen({super.key});

  @override
  State<EmojiLikertFeedbackScreen> createState() => _EmojiLikertFeedbackScreenState();
}

class _EmojiLikertFeedbackScreenState  extends State<EmojiLikertFeedbackScreen> {
  final PageController _pageController = PageController();
  int _currentQuestionIndex = 0;
  bool _showCongratulations = false;
  final List<Map<String, dynamic>> userResponses = [];

  final List<Map<String, dynamic>> feedbackQuestions = hotelFeedbackCategories;


  final List<String> emojiAnimations = [
    "assets/gif/angry.gif",
    "assets/gif/disagree.gif",
    "assets/gif/natural.gif",
    "assets/gif/happy.gif",
    "assets/gif/greatWork.gif"
  ];

  final List<String> labels = [
    "Strongly Disagree",
    "Disagree",
    "Neutral",
    "Agree",
    "Strongly Agree"
  ];


  void _handleEmojiTap(int emojiIndex) {
    final currentCategory = feedbackQuestions[_currentQuestionIndex];
    final questionData = currentCategory['questions'][0];
    // Convert UI index (0–4) to rating scale (1–5)
    final rating = emojiIndex + 1;

    final followUpMap = questionData['followUpOptionsByEmoji'][rating];

    if (followUpMap != null) {
      final String followUpQuestion = followUpMap['followUp'];
      final List<String> options = List<String>.from(followUpMap['options']);

      showFeedbackFollowupBottomSheet(
        context: context,
        followUpQuestion: followUpQuestion,
        options: options,
        onOptionSelected: (selectedOption) {
          // Optionally store: category, rating, selectedOption
          userResponses.add({
            "category": currentCategory['category'],
            "rating": rating,
            "response": selectedOption,
          });
          print("Category: ${currentCategory['category']}, Rating: $rating, Response: $selectedOption");
          _nextQuestion();
        },
      );
    } else {
      // fallback (should not occur with your dataset)
      _nextQuestion();
    }
  }



  void _nextQuestion() {
    if (_currentQuestionIndex < feedbackQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() {
        _showCongratulations = true;
      });
    }
  }

  Widget _buildQuestionPage(Map<String, dynamic> questionData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const RKSizedBox.h100(),
        RKText(
          questionData['questions'][0]['question'],
          style: RKTextStyle.paragraph3,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),

        const RKSizedBox.h40(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(emojiAnimations.length, (index) {
            return GestureDetector(
              onTap: () => _handleEmojiTap(index),
              child: Column(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      emojiAnimations[index],
                      fit: BoxFit.contain,
                    ),
                  ),

                  const RKSizedBox.h4(),
                  SizedBox(
                    width: 70,
                    child: RKText(
                      labels[index],
                      style: RKTextStyle.paragraph1, // 👈 make sure this has fontSize: 10
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),

                  )
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final businessName = feedbackQuestions[_currentQuestionIndex]['business']?.toString() ?? 'Hotel';
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB833A6), Color(0xFFEC6F66)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const RKPaddings.h16(),
              child: Column(
                children: [
                  // Header
                  const RKSizedBox.h16(),
                  Padding(
                    padding: const RKPaddings.symmetric(vertical: 8),
                    child: RKStepProgressBar(
                      totalSteps: feedbackQuestions.length,
                      currentStep: _currentQuestionIndex,
                    ),
                  ),
                  const RKSizedBox.h20(),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_currentQuestionIndex > 0) {
                            setState(() {
                              _currentQuestionIndex--;
                            });
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: _currentQuestionIndex > 0 ? Colors.white : Colors.white24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      RKText(
                        'Feedback of $businessName',
                        style: RKTextStyle.h3,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),


                  const RKSizedBox.h20(),



                  RKText(
                    feedbackQuestions[_currentQuestionIndex]['category'],
                    style: RKTextStyle.h2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const RKSizedBox.h4(),

                  const RKText(
                    "Please rate your experience for the following statements.",
                    style: RKTextStyle.paragraph4, // 👈 should match fontSize: 14
                    color: Colors.white70,
                    textAlign: TextAlign.center,
                  ),
                  const RKSizedBox.h20(),

                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: feedbackQuestions.length,
                      itemBuilder: (context, index) {
                        return _buildQuestionPage(feedbackQuestions[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const RKPaddings.b30(),
                    child: RKButton(
                      text: _currentQuestionIndex == feedbackQuestions.length - 1 ? "Publish" : "Next",
                      buttonBgColor: Colors.amber,
                      buttonTextColor: Colors.black,
                      onPressed: () {
                        if (_currentQuestionIndex == feedbackQuestions.length - 1) {
                          setState(() {
                            _showCongratulations = true;
                          });
                        } else {
                          _nextQuestion();
                        }
                      },
                      size: RKButtonSize.custom50, // 👈 CORRECT USAGE
                    ),

                  ),
                ],
              ),
            ),
          ),
          if (_showCongratulations)
            CongratulationsPopup(
              onFinish: () {
                Navigator.pop(context); // or reset navigation
              },
            ),

        ],
      ),
    );
  }
}

