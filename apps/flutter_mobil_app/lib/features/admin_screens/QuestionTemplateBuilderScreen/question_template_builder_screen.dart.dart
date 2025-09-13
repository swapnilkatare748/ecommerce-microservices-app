import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/routes/route_helper.dart';
import '../widget/custom_gradient_appbar.dart';
import '../widget/feedback_preview_widget.dart';

class QuestionForm extends StatefulWidget {
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  String selectedField = '';
  List<TextEditingController> questionControllers = [TextEditingController()];

  void addQuestion() {
    setState(() {
      questionControllers.add(TextEditingController());
    });
  }

  void _onFieldSelected(String value) {
    setState(() {
      selectedField = value;
    });
  }

  Widget questionTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const RKPaddings.a16(),
      decoration: BoxDecoration(
        color: const Color(0xFF9D4EDD),
        borderRadius: BorderRadius.circular(kBorderRadius),
        border: Border.all(color: const Color(0xFF7B2CBF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RKTextFormField(
            controller: questionControllers[index],
            hintText: 'Type your question here',
            fillBgColor: true,
            bgColor: const Color(0xFF7B2CBF),
            borderColor: const Color(0xFF5A189A),
            borderRadius: kButtonRadius,
            hintStyle: const TextStyle(color: Colors.white70),
            textStyle: const TextStyle(color: Colors.white),
          ),
          const RKSizedBox.h12(),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  final text = questionControllers[index].text;
                  Clipboard.setData(ClipboardData(text: text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text.isNotEmpty
                          ? 'Question copied to clipboard!'
                          : 'No text to copy!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Icon(Icons.copy, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final feedbackType = getFeedbackTypeFromString(selectedField);

    return Stack(
      children: [
        const FancyPurpleBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: FormSectionHeader(
                  currentStep: 1,
                  onStepTap: (index) {
                    print('Tapped on section \$index');
                  },
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const RKPaddings.a16(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const RKSizedBox.h24(),
                          TemplateFormWidget(onFieldSelected: _onFieldSelected),
                          const RKSizedBox.h24(),
                          if (selectedField.isNotEmpty) ...[
                            if (feedbackType != null)
                              FeedbackPreviewWidget(type: feedbackType),
                            const RKSizedBox.h24(),
                            ...List.generate(
                              questionControllers.length,
                                  (index) => questionTile(index),
                            ),
                            const RKSizedBox.h16(),
                            RKButton.outlined(
                              text: "+ Add Question",
                              onPressed: addQuestion,
                              borderColor: const Color(0xFFD0A2F7),
                              buttonBgColor: const Color(0xFF7B2CBF),
                              buttonTextColor: Colors.white,
                              padding: const RKPaddings.symmetric(vertical: 14),
                            ),
                            const RKSizedBox.h24(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomActionButton(
                                    label: "Next",
                                    onPressed: () {
                                      RouteHelper.push(AppRoutes.SETTING_TEMPLATE_SCREEN);
                                    },
                                  ),
                                  const RKSizedBox.w24(),
                                ],
                              ),
                            ),
                            const RKSizedBox.h16(),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TemplateFormWidget extends StatefulWidget {
  final ValueChanged<String> onFieldSelected;
  const TemplateFormWidget({Key? key, required this.onFieldSelected}) : super(key: key);

  @override
  _TemplateFormWidgetState createState() => _TemplateFormWidgetState();
}

class _TemplateFormWidgetState extends State<TemplateFormWidget> {
  String selectedField = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const RKPaddings.a16(),
      decoration: BoxDecoration(
        color: const Color(0xFF9D4EDD),
        borderRadius: BorderRadius.circular(kBorderRadius),
        border: Border.all(color: const Color(0xFF7B2CBF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RKText(
            'Template Name',
            style: RKTextStyle.h6,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          const RKSizedBox.h8(),
          RKTextFormField(
            hintText: 'Add Template',
            fillBgColor: true,
            bgColor: const Color(0xFF7B2CBF),
            borderColor: const Color(0xFF5A189A),
            borderRadius: kButtonRadius,
            hintStyle: const TextStyle(color: Colors.white70),
            textStyle: const TextStyle(color: Colors.white),
          ),
          const RKSizedBox.h24(),
          RKText(
            'Choose Fields',
            style: RKTextStyle.h6,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          const RKSizedBox.h12(),
          _buildRadioOption('Ratings'),
          _buildRadioOption('Likert Scale'),
          _buildRadioOption('NPS Score'),
          _buildRadioOption('Emoji Slider'),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedField,
          onChanged: (val) {
            setState(() {
              selectedField = val!;
              widget.onFieldSelected(selectedField);
            });
          },
          activeColor: Colors.amber,
        ),
        RKText(
          value,
          style: RKTextStyle.paragraph1,
          color: Colors.white,
        ),
      ],
    );
  }
}