import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/dashboard/dashboard_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/page_header/page_header.dart';
import 'package:view_model/view_model.dart';

class DashBoardPage extends InjectableStateless {
  DashboardStrings get strings => inject();

  const DashBoardPage(super.inject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(inject, title: strings.title, description: strings.subtitle),
          const Gap(16),
          const Gap(16),
          Expanded(child: _TableView(inject)),
        ],
      ),
    );
  }
}

class _TableView extends InjectableStateless {
  DashboardViewModel get vm => inject();

  DashboardStrings get strings => inject();

  const _TableView(super.inject);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
