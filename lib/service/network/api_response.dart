class ApiResponse<T> {
  bool success = true;
  String? message = '';
  int? statusCode;
  T? data;

  ApiResponse({
        this.success = true,
        this.message = '',
        this.statusCode,
        this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['isSuccess'] ?? true;
    message = json['message'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = success;
    data['message'] = message;
    return data;
  }
}
