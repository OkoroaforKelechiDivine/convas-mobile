import '../../../model/params/create_account/create_account_param.dart';
import '../../../model/response/auth/create_account/create_account_response.dart';
import '../../../service/network/api_failure.dart';
import '../../../service/network/api_response.dart';
import '../../../service/network/api_service.dart';

class CreateAccountApi{
  final _apiService  = ApiService(path: "/api/auths");

  Future<ApiResponse<CreateAccountResponse>> createAccount({required CreateAccountParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = CreateAccountResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}