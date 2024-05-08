class CreateAccountResponse {
  final String message;

  CreateAccountResponse({
    required this.message,
  });

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
