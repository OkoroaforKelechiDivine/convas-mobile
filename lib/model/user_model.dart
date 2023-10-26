class AppUser {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;

  AppUser({
    this.firstName,
    required this.id,
    this.lastName,
    this.email,
    this.profileImageUrl,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      id: json['id'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
