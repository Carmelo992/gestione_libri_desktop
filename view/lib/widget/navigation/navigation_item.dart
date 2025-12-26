import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

enum NavigationItem {
  dashboard(iconData: Icons.dashboard_outlined),
  users(iconData: Icons.list_outlined),
  clients(iconData: Icons.supervisor_account_sharp),
  years(iconData: Icons.calendar_month_outlined),
  websites(iconData: Icons.language);

  const NavigationItem({required this.iconData});

  final IconData iconData;

  String get label => name.pascalCase;
}
