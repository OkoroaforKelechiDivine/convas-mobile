class CreateAccountParam {
  final String firstName;
  final String lastName;
  final String password;
  final String gender;
  final String phoneNumber;

  CreateAccountParam({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.gender,
    required this.phoneNumber,
  });

  factory CreateAccountParam.fromJson(Map<String, dynamic> json) =>
      CreateAccountParam(
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "password": password,
    "gender": gender,
    "phoneNumber": phoneNumber,
  };
}
