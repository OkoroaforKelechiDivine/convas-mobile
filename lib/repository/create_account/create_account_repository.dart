import '../../controller/apis/create_account/create_account_api.dart';
import '../../model/params/create_account/create_account_param.dart';
import '../../model/response/auth/create_account/create_account_response.dart';
import '../../service/network/api_response.dart';

  class CreateAccountRepository{

    final _createAccountAPI = CreateAccountApi();

    Future<ApiResponse<CreateAccountResponse>>createAccount({required CreateAccountParam param}) async {
      return _createAccountAPI.createCustomer(param: param);
    }
  }