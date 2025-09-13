import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/routes/route_helper.dart';
import '../widget/custom_gradient_appbar.dart';
import '../widget/form_flow_view_model.dart';

class AdminDashboardScreenView extends StatelessWidget {
  final List<String> categories = [
    'Customer Feedback Templates',
    'Employee Feedback Templates',
    'Product & Service Templates'
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormFlowViewModel>(context);

    return Stack(
      children: [
        const FancyPurpleBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RKText(
                            'Form Builder Options',
                            style: RKTextStyle.h3,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    const RKSizedBox.h16(),
                    FormSectionHeader(currentStep: 0, onStepTap: (int) {}),
                    const RKSizedBox.h16(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        width: 34,
                        height: 34,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange, width: 1),
                          color: Colors.transparent,
                        ),
                        child: const Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              RouteHelper.push(AppRoutes.QUESTION_TEMPLATE_BUILDER_SCREEN);
            },
            child: Container(
              width: 52.27,
              height: 52.27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  center: Alignment(1.08, -0.15),
                  radius: 0.85,
                  colors: [
                    Color(0xFFFAE73F),
                    Color(0xFFAA8516),
                    Color(0xFFAA8516),
                  ],
                  stops: [0.0, 0.52, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFAA8516),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: categories.asMap().entries.map((entry) {
                final index = entry.key;
                final category = entry.value;
                final isExpanded = viewModel.expandedIndex == index;
                final templates = viewModel.dummyTemplates[category] ?? [];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewModel.toggleExpand(index);
                      },
                      child: GlassmorphicTile(
                        label: category,
                        isExpanded: isExpanded,
                        onTap: () {},
                      ),
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: templates
                              .map(
                                (template) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: RKText(
                                template,
                                style: RKTextStyle.h5,
                                color: Colors.white70,
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
