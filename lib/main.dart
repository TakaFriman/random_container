import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_container/pages/home/view/home_page.dart';

import 'pages/home/components/components.dart';

void main() {
  runZonedGuarded(() async {
    runApp(
      ChangeNotifierProvider(
        create: (_) => SelectionHistoryProvider(),
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) {
    log('Произошла ошибка: $error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
