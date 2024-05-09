  import 'package:safe_chat/core/data/datasource/remote/apis/create_account/create_account_api.dart';
  import 'package:safe_chat/core/data/model/params/create_account/create_account_param.dart';
  import 'package:safe_chat/core/data/model/response/auth/create_account/create_account_response.dart';

  import '../../datasource/remote/base/api_response.dart';

  class CreateAccountRepository{

    final _createAccountAPI = CreateAccountApi();

    Future<ApiResponse<CreateAccountResponse>>createAccount({required CreateAccountParam param}) async {
      return _createAccountAPI.createCustomer(param: param);
    }
  }