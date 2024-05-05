// import 'dart:async';
//
// class WelcomeViewModel {
//   late String _typedText;
//   late int _index;
//   late final StreamController<String> _textController;
//
//   WelcomeViewModel() : _textController = StreamController<String>() {
//     _typedText = '';
//     _index = 0;
//     _startTyping();
//   }
//
//   Stream<String> get text => _textController.stream;
//
//   void _startTyping() {
//     Future.delayed(const Duration(seconds: 1), () {
//       _clearText();
//     });
//     print("I actually started typing");
//   }
//
//   void _clearText() {
//     _typedText = '';
//     _index = 0;
//     _updateText();
//     Future.delayed(const Duration(seconds: 2), () {
//       _startTypingAgain();
//     });
//     print("I have cleared the text oo");
//   }
//
//   void _startTypingAgain() {
//     const typingDelay = Duration(milliseconds: 100);
//     print(typingDelay);
//     Future.delayed(typingDelay, () {
//       if (_index < _typedText.length) {
//         _typedText = _typedText.substring(0, _index + 1);
//         _index++;
//         _updateText();
//         _startTypingAgain();
//       } else {
//         _startTyping();
//       }
//     });
//   }
//
//   void _updateText() {
//     _textController.add(_typedText);
//   }
// }
