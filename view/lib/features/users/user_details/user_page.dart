import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/users/user_details/user_details_strings.dart';
import 'package:view/features/users/user_details/user_not_found_page.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view_model/view_model.dart';

class UserPage extends InjectableStateless {
  UserDetailsViewModel get vm => inject();

  UserDetailsStrings get strings => inject();

  UserPage(super.inject, {super.key, required this.userId}) {
    vm.loadUser(userId);
  }

  final String userId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: vm.isLoading,
      builder: (context, isLoading, child) {
        if (isLoading) return Center(child: CircularProgressIndicator());
        return ValueListenableBuilder(
          valueListenable: vm.user,
          builder: (context, user, child) {
            if (user == null) return UserNotFoundPage(userId: userId, strings: strings);
            return ContentView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
                  Text(strings.userRole(user.role)),
                  Text(strings.userId(user.userId)),
                  const Gap(16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.navigate_before),
                    label: Text(strings.backMessage),
                    onPressed: Navigator.of(context).pop,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
