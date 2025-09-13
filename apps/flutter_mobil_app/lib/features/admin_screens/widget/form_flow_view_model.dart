import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../shared/constants/app_routes.dart';

class FormFlowViewModel extends ChangeNotifier {
  String? selectedCategory;
  String? selectedRatingType;
  Map<String, dynamic> answers = {};
  int? expandedIndex;
  int _currentStep = 0;
  final List<int> _completedSections = [];

  final Map<String, List<String>> dummyTemplates = {
    'Customer Feedback Templates': [
      'Customer Satisfaction Survey',
      'Product Feedback Form',
      'Service Quality Assessment',
    ],
    'Employee Feedback Templates': [
      'Employee Engagement Survey',
      'Performance Review Form',
      'Workplace Environment Survey',
    ],
    'Product & Service Templates': [
      'New Product Launch Feedback',
      'Service Improvement Survey',
      'Feature Request Form',
    ],
  };

  final List<String> ratingOptions = [
    'Ratings',
    'Likert Scale',
    'NPS Score',
    'Emoji Slider',
  ];

  final List<String> textFields = ['template_name'];

  String apiUrl = "https://your-api.com/rating-preference";

  int get currentStep => _currentStep;
  List<int> get completedSections => _completedSections;

  void selectCategory(String category) {
    selectedCategory = category;
    _markSectionComplete(0);
    notifyListeners();
  }

  void selectRatingType(String type) {
    selectedRatingType = type;
    _checkSection1Completion();
    notifyListeners();
  }

  void setAnswer(String questionId, dynamic answer) {
    answers[questionId] = answer;
    if (questionId == 'template_name') {
      _checkSection1Completion();
    }
    notifyListeners();
  }

  void setFormSettings({
    bool? isMandatory,
    bool? isAnonymous,
    int? submissionType,
    bool? autoSave,
    bool? saveIncomplete,
  }) {
    if (isMandatory != null) answers['isMandatory'] = isMandatory;
    if (isAnonymous != null) answers['isAnonymous'] = isAnonymous;
    if (submissionType != null) answers['submissionType'] = submissionType;
    if (autoSave != null) answers['autoSave'] = autoSave;
    if (saveIncomplete != null) answers['saveIncomplete'] = saveIncomplete;
    _markSectionComplete(3);
    notifyListeners();
  }

  void setCurrentStep(int step) {
    if (step <= _completedSections.length || step == _currentStep) {
      _currentStep = step;
      notifyListeners();
    }
  }

  void _markSectionComplete(int sectionIndex) {
    if (!_completedSections.contains(sectionIndex)) {
      _completedSections.add(sectionIndex);
      notifyListeners();
    }
  }

  void _checkSection1Completion() {
    if (selectedRatingType != null &&
        answers['template_name'] != null &&
        answers['template_name'].toString().isNotEmpty) {
      _markSectionComplete(1);
    }
  }

  String getRouteForStep(int step) {
    switch (step) {
      case 0:
        return AppRoutes.FORMBUILDER_HOME_SCREEN;
      default:
        return AppRoutes.FORMBUILDER_HOME_SCREEN; // Placeholder for sections 4–6
    }
  }

  void toggleExpand(int index) {
    if (expandedIndex == index) {
      expandedIndex = null;
    } else {
      expandedIndex = index;
    }
    notifyListeners();
  }

  bool get isReadyForSubmit =>
      selectedCategory != null &&
          selectedRatingType != null &&
          answers.isNotEmpty;

  bool get isReady =>
      selectedRatingType != null &&
          answers['template_name'] != null &&
          answers['template_name'].toString().isNotEmpty;

  Future<bool> submit() async {
    try {
      final payload = {
        'rating_type': selectedRatingType,
        ...answers,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      return response.statusCode == 200;
    } catch (e) {
      debugPrint("API Error: $e");
      return false;
    }
  }

  void reset() {
    selectedCategory = null;
    selectedRatingType = null;
    answers.clear();
    expandedIndex = null;
    _currentStep = 0;
    _completedSections.clear();
    notifyListeners();
  }
}
