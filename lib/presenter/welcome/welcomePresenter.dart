// import 'package:flutter/material.dart';
//
// import '../../model/view_model/welcome_view_model.dart';
//
// class WelcomePresenter extends StatefulWidget {
//   final String text;
//   final TextStyle textStyle;
//   final Duration durationPerChar;
//
//   const WelcomePresenter({
//     Key? key,
//     required this.text,
//     required this.textStyle,
//     required this.durationPerChar,
//   }) : super(key: key);
//
//   @override
//   _WelcomePresenterState createState() => _WelcomePresenterState();
// }
//
// class _WelcomePresenterState extends State<WelcomePresenter> {
//   late WelcomeViewModel model;
//
//   @override
//   void initState() {
//     super.initState();
//     model = WelcomeViewModel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<String>(
//       stream: model.text,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Text(
//             snapshot.data!,
//             style: widget.textStyle,
//           );
//         } else {
//           return Text(
//             widget.text,
//             style: widget.textStyle,
//           );
//         }
//       },
//     );
//   }
// }
