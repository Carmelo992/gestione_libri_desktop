import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/navigation/navigation.dart';
import 'package:view_model/view_model.dart';

class ScaffoldWithNavigation extends InjectableStateful {
  final void Function() openDashboard;

  SessionViewModel get vm => inject();

  const ScaffoldWithNavigation(super.inject, {super.key, required this.navigationShell, required this.openDashboard});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavigation> createState() => _ScaffoldWithNavigationState();
}

class _ScaffoldWithNavigationState extends State<ScaffoldWithNavigation> {
  final ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    return switch (breakpoint.name) {
      MOBILE || TABLET => _ScaffoldWithDrawer(
        widget.inject,
        widget.navigationShell,
        openDashboard: widget.openDashboard,
        vm: widget.vm,
      ),
      (_) => _ScaffoldWithNavigationRail(
        widget.inject,
        widget.navigationShell,
        openDashboard: widget.openDashboard,
        isExpanded: isExpanded,
        vm: widget.vm,
      ),
    };
  }
}

class _ScaffoldWithNavigationRail extends InjectableStateless {
  final void Function() openDashboard;
  final SessionViewModel vm;

  const _ScaffoldWithNavigationRail(
    super.inject,
    this.navigationShell, {
    required this.openDashboard,
    required this.isExpanded,
    required this.vm,
  });

  final StatefulNavigationShell navigationShell;

  final ValueNotifier<bool> isExpanded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationAppBar(inject, openDashboard: openDashboard, vm: vm),
      body: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: isExpanded,
                  builder: (context, value, child) {
                    return _NavigationRail(navigationShell: navigationShell, expand: value);
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(16), child: ThemeModeButton.icon()),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20, child: VerticalDivider()),
              InkWell(
                onTap: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ValueListenableBuilder(
                    valueListenable: isExpanded,
                    builder: (context, value, child) {
                      return AnimatedRotation(
                        turns: value ? 0.25 : 0.75,
                        duration: Duration(milliseconds: 300),
                        child: Icon(Icons.expand_circle_down_outlined),
                      );
                    },
                  ),
                ),
              ),
              Expanded(child: VerticalDivider()),
            ],
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

class _ScaffoldWithDrawer extends InjectableStateless {
  final void Function() openDashboard;
  final SessionViewModel vm;

  const _ScaffoldWithDrawer(super.inject, this.navigationShell, {required this.openDashboard, required this.vm});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: NavigationAppBar(inject, openDashboard: openDashboard, vm: vm),
      body: navigationShell,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(border: Border()),
              margin: EdgeInsets.zero,
              child: Center(
                child: Text("Emile CMS", style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            Expanded(child: _NavigationRail(navigationShell: navigationShell, expand: true)),
            const Padding(padding: EdgeInsets.all(16), child: ThemeModeButton.outlined()),
          ],
        ),
      ),
    );
  }
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail({required this.navigationShell, required this.expand});

  final StatefulNavigationShell navigationShell;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return NavigationRail(
      extended: expand,
      selectedIndex: navigationShell.currentIndex,
      unselectedLabelTextStyle: theme.textTheme.bodyMedium,
      selectedLabelTextStyle: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
      onDestinationSelected: (index) {
        navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
      },
      destinations: [
        for (final item in NavigationItem.values)
          NavigationRailDestination(icon: Icon(item.iconData), label: Text(item.label)),
      ],
    );
  }
}
