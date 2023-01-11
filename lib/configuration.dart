import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tappedinterview/provider/book_list_provider.dart';
import 'package:tappedinterview/provider/book_list_to_continue_provider.dart';
import 'package:tappedinterview/theme/storyways_theme.dart';
import 'package:tappedinterview/ui/screens/home_screen.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyways',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: StorywaysThemeData.lightThemeData,
      darkTheme: StorywaysThemeData.darkThemeData,
      home: const ProviderConfiguration(child: HomeScreen()),
    );
  }
}

class ProviderConfiguration extends StatelessWidget {
  const ProviderConfiguration({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookListToContinueProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookListProvider(),
        ),
      ],
      child: child,
    );
  }
}
