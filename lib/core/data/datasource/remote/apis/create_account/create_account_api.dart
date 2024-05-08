import 'package:safe_chat/core/data/datasource/remote/base/api_service.dart';
import 'package:safe_chat/core/data/model/params/create_account/create_account_param.dart';

import '../../../../model/response/auth/create_account/create_account_response.dart';
import '../../base/api_failure.dart';
import '../../base/api_response.dart';

class CreateAccountApi{
  final _apiService  = ApiService(path: "/api/auths");

  Future<ApiResponse<CreateAccountResponse>> createCustomer({required CreateAccountParam param}) async {
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