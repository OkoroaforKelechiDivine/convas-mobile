import 'package:stacked/stacked.dart';

import '../../utilities/constants/app_assets/assets.dart';

class FeedsViewModel extends BaseViewModel {
  String _inputText = '';
  bool _isWhatIsOnYourMindButtonSelected = true;
  List<bool> _showComments = [false];

  String get inputText => _inputText;

  bool get isWhatIsOnYourMindButtonSelected => _isWhatIsOnYourMindButtonSelected;

  bool shouldShowComments(int index) => _showComments[index];

  void selectWhatIsOnYourMind() {
    _isWhatIsOnYourMindButtonSelected = true;
    notifyListeners();
  }

  void selectWhileYouWereAway() {
    _isWhatIsOnYourMindButtonSelected = false;
    notifyListeners();
  }

  void showComments(int index) {
    _showComments[index] = !_showComments[index];
    notifyListeners();
  }

  set inputText(String value) {
    _inputText = _formatText(value);
    notifyListeners();
  }

  String _formatText(String text) {
    List<String> lines = text.split('\n');
    List<String> formattedLines = [];
    for (var line in lines) {
      while (line.length > 40) {
        formattedLines.add(line.substring(0, 40));
        line = line.substring(40);
      }
      formattedLines.add(line);
    }
    return formattedLines.join('\n');
  }

  List<User> users = [
    User(
      name: 'John Doe',
      image: AssetsImageExport.security,
      datePosted: 'May 13, 2024',
      timePosted: "9:45pm",
      impressionsCount: 100,
      postContent: "You are still the one I love",
      commentsCount: 20,
      comments: [
        Comment(
          commenter: 'Alice',
          comment: 'Nice post!',
        ),
        Comment(
          commenter: 'Bob',
          comment: 'Keep it up!',
        ),
      ],
    ),
  ];
}

class User {
  final String name;
  final String image;
  final String datePosted;
  final String postContent;
  final String timePosted;
  final int impressionsCount;
  final int commentsCount;
  final List<Comment> comments;

  User({
    required this.name,
    required this.image,
    required this.timePosted,
    required this.postContent,
    required this.datePosted,
    required this.impressionsCount,
    required this.commentsCount,
    required this.comments,
  });
}

class Comment {
  final String commenter;
  final String comment;

  Comment({
    required this.commenter,
    required this.comment,
  });
}
