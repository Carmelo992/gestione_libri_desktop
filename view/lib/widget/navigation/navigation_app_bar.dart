import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/generated/app_localizations.dart';
import 'package:view/injectable.dart';
import 'package:view_model/view_model.dart';

import 'navigation_title.dart';

class NavigationAppBar extends InjectableStateless implements PreferredSizeWidget {
  final VoidCallback openDashboard;
  final SessionViewModel vm;

  const NavigationAppBar(super.inject, {super.key, required this.openDashboard, required this.vm});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: NavigationTitle(inject, openDashboard: openDashboard),
      centerTitle: false,
      elevation: 4,
      actions: [
        ValueListenableBuilder(
          valueListenable: vm.fullName,
          builder: (context, fullName, child) {
            return Text(fullName ?? "");
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: PopupMenuButton<void>(
            itemBuilder: (context) => [PopupMenuItem(onTap: vm.logout, child: Text(inject<AppLocalization>().logout))],
            child: const Icon(Icons.account_circle_outlined),
          ),
        ),
        const Gap(8),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
