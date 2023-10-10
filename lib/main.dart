import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_chat/service/token/TokenProvider.dart';

import 'app.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TokenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
