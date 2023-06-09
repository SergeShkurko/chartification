import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:chartification/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  /// For unit testing only
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then((value) {
      initPrefManager(value);
    });
    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
    dataSources();
    repositories();
    useCase();
    cubit();
  } else {
    sl.registerSingleton<DioClient>(DioClient());
    dataSources();
    repositories();
    useCase();
    cubit();
  }
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<GeneralRepository>(
    () => GeneralRepositoryImpl(sl()),
  );
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<GeneralRemoteDatasource>(
    () => GeneralRemoteDatasourceImpl(sl()),
  );
}

void useCase() {
  /// General
  sl.registerLazySingleton(() => GetQuotation(sl()));
}

void cubit() {
  /// General
  sl.registerFactory(() => QuotationStore(sl()));
  sl.registerFactory(() => QuotationDetailsStore(sl()));
}
