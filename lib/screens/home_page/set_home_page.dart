
import 'package:flutter/material.dart';
import 'dart:io';


class HomePageScreen extends StatefulWidget {
  final File? image;

  const HomePageScreen({super.key, this.image});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: widget.image != null ? Image.file(widget.image!) : const Text("No image selected"),
      ),
    );  }
}
