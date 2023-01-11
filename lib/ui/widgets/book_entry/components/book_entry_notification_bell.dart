import 'package:flutter/material.dart';
import 'package:tappedinterview/theme/storyways_icons.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Change notification bell to another icon when clicked
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // TODO: If notification is activated, change icon
        child: const Icon(StorywaysIcons.bell),
      ),
    );
  }
}
