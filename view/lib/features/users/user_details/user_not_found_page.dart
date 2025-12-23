import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/users/user_details/user_details_strings.dart';

class UserNotFoundPage extends StatelessWidget {
  final UserDetailsStrings strings;

  const UserNotFoundPage({super.key, required this.userId, required this.strings});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.title, style: Theme.of(context).textTheme.headlineMedium),
            const Gap(8),
            Text(strings.message(userId)),
          ],
        ),
      ),
    );
  }
}
