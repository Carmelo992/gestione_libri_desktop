import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/users/users_list/users_list_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/page_header.dart';
import 'package:view_model/view_model.dart';

class UsersPage extends InjectableStateless {
  UsersViewModel get vm => inject();

  UsersListStrings get strings => inject();

  final void Function(String id) openDetails;

  const UsersPage(super.inject, {required this.openDetails, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(title: strings.title, description: strings.subtitle),
          const Gap(16),
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: ValueListenableBuilder(
                valueListenable: vm.users,
                builder: (context, users, child) {
                  return ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(
                          user.name,
                          style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(user.role, style: theme.textTheme.labelMedium),
                        trailing: const Icon(Icons.navigate_next_outlined),
                        onTap: () {
                          openDetails(user.userId);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
