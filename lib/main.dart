import 'package:domino_point/my_app/my_app.dart';
import 'package:domino_point/src/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // using provider

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
