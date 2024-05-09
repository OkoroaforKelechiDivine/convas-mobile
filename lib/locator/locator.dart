import 'package:get_it/get_it.dart';

import '../../repository/create_account/create_account_repository.dart';
import '../../service/local/auth_storage/auth_local_storage.dart';
import '../../service/navigations/navigation_service.dart';
import '../../service/remote/authentication_data_provider.dart';
import '../app_style/snack_bar/snack_bar_service.dart';
import 'app_globals.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthenticationDataProvider>(() => AuthenticationDataProvider());
  //locator.registerLazySingleton<TransferDataProvider>(() => TransferDataProvider());

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarService());
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
SnackBarService snackbarService = locator.get<SnackBarService>();
// BottomSheetService bottomSheetService = locator.get<BottomSheetService>();

//STORAGES
AuthLocalStorage authLocalStorage = locator.get<AuthLocalStorage>();
// AppLocalStorage appLocalStorage = locator.get<AppLocalStorage>();

//REPOS
CreateAccountRepository createAccountRepository = locator.get<CreateAccountRepository>();
