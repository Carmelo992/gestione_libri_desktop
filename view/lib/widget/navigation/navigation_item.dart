import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

enum NavigationItem {
  dashboard(iconData: Icons.dashboard_outlined),
  users(iconData: Icons.list_outlined),
  clients(iconData: Icons.supervisor_account_sharp);

  const NavigationItem({required this.iconData});

  final IconData iconData;

  String get label => name.pascalCase;
}
