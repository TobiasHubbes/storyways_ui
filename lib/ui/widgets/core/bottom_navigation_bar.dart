import 'package:flutter/material.dart';
import 'package:tappedinterview/theme/storyways_icons.dart';

class StorywaysBottomNavigationBar extends StatelessWidget {
  const StorywaysBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Rounded Container in white
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(StorywaysIcons.home),
                const SizedBox(width: 8),
                Text(
                  "Home",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(StorywaysIcons.stack),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(StorywaysIcons.compass),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(StorywaysIcons.forward),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
