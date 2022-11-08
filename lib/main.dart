import 'package:flutter/material.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/characters_list_screen.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: CustomColors.backgroundColor,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: CustomColors.backgroundColor,
          actionsIconTheme: IconThemeData(
            color: CustomColors.pink,
          ),
          elevation: 0,
        ),
      ),
      home: const CharactersListScreen(),
    );
  }
}
