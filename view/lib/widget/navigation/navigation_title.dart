import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:view/generated/app_localizations.dart';
import 'package:view/injectable.dart';

class NavigationTitle extends InjectableStateless {
  final void Function() openDashboard;

  const NavigationTitle(super.inject, {super.key, required this.openDashboard});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Visibility(
          visible: ResponsiveBreakpoints.of(context).largerThan(MOBILE),
          child: GestureDetector(
            onTap: openDashboard,
            child: Text(
              inject<AppLocalization>().appName,
              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
