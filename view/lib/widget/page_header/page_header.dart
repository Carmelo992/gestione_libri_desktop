import 'package:flutter/material.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/page_header/page_header_strings.dart';

class PageHeader extends InjectableStateless {
  const PageHeader(super.inject, {super.key, required this.title, required this.description, this.onAdd});

  final String title;
  final String description;
  final VoidCallback? onAdd;

  PageHeaderStrings get strings => inject();

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
            if (onAdd != null) OutlinedButton(onPressed: onAdd, child: Text(strings.add)),
          ],
        ),
        Text(description),
      ],
    );
  }
}
