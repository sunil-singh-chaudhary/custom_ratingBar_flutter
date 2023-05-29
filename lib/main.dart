import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ratingbar/star_count.dart';

import 'homepage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StarCountProvider>(
          create: (context) {
            return StarCountProvider();
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(color: Colors.pinkAccent[100]),
        dialogBackgroundColor: Colors.white60,
        buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blue, splashColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
