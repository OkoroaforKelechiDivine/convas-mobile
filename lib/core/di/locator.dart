import 'package:get_it/get_it.dart';
import 'package:safe_chat/core/data/repository/create_account/create_account_repository.dart';

import '../../view_models/service/navigations/navigation_service.dart';
import '../../view_models/service/snack_bar/snack_bar_service.dart';
import '../data/datasource/local/auth_local_storage.dart';
import '../data/datasource/remote/authentication_data_provider.dart';
import 'app_globals.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthenticationDataProvider>(() => AuthenticationDataProvider());
  //locator.registerLazySingleton<TransferDataProvider>(() => TransferDataProvider());

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
  // locator.registerLazySingleton<BottomSheetService>(() => BottomSheetService());

  //STORAGES
  locator.registerLazySingleton(() => AuthLocalStorage());
  // locator.registerLazySingleton(() => AppLocalStorage());
  //GLOBALS
  locator.registerLazySingleton(() => AppGlobals.instance);

  //REPOS
  locator.registerLazySingleton(() => CreateAccountRepository());
  // locator.registerLazySingleton(() => BankRepo());
  // locator.registerLazySingleton(() => BusinessRepo());
  // locator.registerLazySingleton(() => TransactionRepo());
  // locator.registerLazySingleton(() => TicketRepo());
  // locator.registerLazySingleton(() => POSRepo());
  // locator.registerLazySingleton(() => InvoiceRepo());
  // locator.registerLazySingleton(() => RoleRepo());
  // locator.registerLazySingleton(() => AdminRepo());
}

//GLOBALS
AppGlobals appGlobals = locator.get<AppGlobals>();

NavigationService navigationService = locator.get<NavigationService>();
SnackbarService snackbarService = locator.get<SnackbarService>();
// BottomSheetService bottomSheetService = locator.get<BottomSheetService>();

//STORAGES
AuthLocalStorage authLocalStorage = locator.get<AuthLocalStorage>();
// AppLocalStorage appLocalStorage = locator.get<AppLocalStorage>();

//REPOS
CreateAccountRepository createAccountRepository = locator.get<CreateAccountRepository>();
