
class Profile {
  String id;
  String username;
  DateTime dateOfBirth;
  String bio;
  String userId;
  String profileImageUrl;
  String hobbies;

  Profile({
    required this.id,
    required this.username,
    required this.dateOfBirth,
    required this.bio,
    required this.userId,
    required this.profileImageUrl,
    required this.hobbies,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      username: json['username'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      bio: json['bio'],
      userId: json['userId'],
      profileImageUrl: json['profileImageUrl'],
      hobbies: json['hobbies'],
    );
  }
}
