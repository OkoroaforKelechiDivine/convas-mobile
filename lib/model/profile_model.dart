class ProfileDTO {
  final String username;
  final DateTime dateOfBirth;
  final String bio;
  final String profileImageUrl;
  final String hobbies;

  ProfileDTO({
    required this.username,
    required this.dateOfBirth,
    required this.bio,
    required this.profileImageUrl,
    required this.hobbies,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'hobbies': hobbies,
    };
  }
}
