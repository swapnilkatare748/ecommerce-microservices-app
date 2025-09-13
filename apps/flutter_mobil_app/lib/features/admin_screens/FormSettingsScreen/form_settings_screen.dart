import 'package:flutter/material.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';

import '../../../shared/constants/app_routes.dart';
import '../../../shared/routes/route_helper.dart';
import '../widget/custom_gradient_appbar.dart';

class FormSettingsScreen extends StatefulWidget {
  const FormSettingsScreen({super.key});

  @override
  State<FormSettingsScreen> createState() => _FormSettingsScreenState();
}



class _FormSettingsScreenState extends State<FormSettingsScreen> {
  bool _isMandatory = true;
  bool _isAnonymous = true;
  int _submissionType = 1;
  bool _autoSave = false;
  bool _saveIncomplete = false;
  int _currentStep = 2;


  @override
  Widget build(BuildContext context) {
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
                  currentStep: 2,
                  onStepTap: (index) {
                    print('Tapped on section \$index');
                  },
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildToggleSection(),
                        const RKSizedBox.h24(),
                        _buildSubmissionTypeSection(),
                        const RKSizedBox.h24(),
                        _buildDraftOptions(),
                      ],
                    ),
                  ),
                  // Next Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomActionButton(
                          label: "Next",
                          onPressed: () {
                            RouteHelper.push(AppRoutes.EMOJI_LIKERT_FEEDBACK_SCREEN);
                          },
                        ),
                        const RKSizedBox.w24(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleSwitch(
          title: 'Make Fields Mandatory',
          subtitle: 'Require respondents to fill required\nquestions',
          value: _isMandatory,
          onChanged: (val) => setState(() => _isMandatory = val),
        ),
        const RKSizedBox.h16(),
        ToggleSwitch(
          title: 'Allow Anonymous Responses',
          subtitle: 'Let users submit feedback without\npersonal identifiers',
          value: _isAnonymous,
          onChanged: (val) => setState(() => _isAnonymous = val),
        ),
      ],
    );
  }

  Widget _buildSubmissionTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RKText(
          'SUBMISSION TYPE',
          style: RKTextStyle.paragraph3.copyWith(fontWeight: FontWeight.bold),
          color: Colors.white70,
        ),
        const RKSizedBox.h8(),
        CustomRadioTile(
          title: 'Single Submission',
          value: 1,
          groupValue: _submissionType,
          onChanged: (val) => setState(() => _submissionType = val!),
        ),
        CustomRadioTile(
          title: 'Multiple Submission',
          value: 2,
          groupValue: _submissionType,
          onChanged: (val) => setState(() => _submissionType = val!),
        ),
      ],
    );
  }

  Widget _buildDraftOptions() {
    return Column(
      children: [
        CustomCheckboxTile(
          title: 'Enable auto-save & Draft mode',
          value: _autoSave,
          onChanged: (val) => setState(() => _autoSave = val!),
        ),
        CustomCheckboxTile(
          title: 'Allow saving incomplete forms',
          value: _saveIncomplete,
          onChanged: (val) => setState(() => _saveIncomplete = val!),
        ),
      ],
    );
  }
}
