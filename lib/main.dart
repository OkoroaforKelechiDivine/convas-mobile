// This is the entry point of my app where I initialize my app and run it. Here, I combined the MyApp with the AppWrapper and set up any necessary providers.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_chat/presenter/service/token/TokenProvider.dart';
import 'app.dart';
import 'app_wrapper.dart';

void main() {
  runApp(
    const MyAppWrapper(),
  );
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TokenProvider()),
        ],
        child: const MyApp(),
      ),
    );
  }
}
