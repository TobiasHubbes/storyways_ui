import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tappedinterview/theme/storyways_icons.dart';
import 'package:tappedinterview/theme/storyways_theme.dart';

class PublishedDateWidget extends StatelessWidget {
  const PublishedDateWidget({required this.publishedDate, super.key});

  final DateTime? publishedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          StorywaysIcons.calendar,
          size: 14,
          color: StorywaysThemeData.publishedDateStyle.color,
        ),
        const SizedBox(width: 9.25),
        Text(_getPublishedDate(), style: StorywaysThemeData.publishedDateStyle)
      ],
    );
  }

  String _getPublishedDate() {
    if (publishedDate == null) {
      return '';
    }
    // TODO: Add locals
//    initializeDateFormatting('de', "");
    return DateFormat(
      'dd MMM yyyy', /*'de'*/
    ).format(publishedDate!);
  }
}
