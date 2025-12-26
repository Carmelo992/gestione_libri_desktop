import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.title, required this.description, this.onAdd});

  final String title;
  final String description;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title, style: theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
            ),
            if (onAdd != null) OutlinedButton(onPressed: onAdd, child: Text("Aggiungi")),
          ],
        ),
        Text(description),
      ],
    );
  }
}
