import 'package:get_it/get_it.dart';
import 'package:popular_git_repos/app/data/data_sources/app_local_data_source.dart';
import 'package:popular_git_repos/app/data/data_sources/app_remote_data_source.dart';
import 'package:popular_git_repos/app/data/repositories/app_repository_impl.dart';
import 'package:popular_git_repos/app/domain/repositories/app_repository.dart';
import 'package:popular_git_repos/core/app_config.dart';
import 'package:popular_git_repos/core/services/local_database.dart';
import 'package:sqflite/sqflite.dart';

GetIt getIt = GetIt.instance;

T getService<T extends Object>() {
  return getIt<T>();
}

abstract class DIContainer {
  static Future<void> configureServices({String env = "test"}) async {
    switch (env) {
      case 'prod':
        getIt.registerSingleton<AppConfig>(AppConfigImplProd.instance);
        break;
      case 'test':
        getIt.registerSingleton<AppConfig>(AppConfigImplTest.instance);
        break;
      default:
        getIt.registerSingleton<AppConfig>(AppConfigImpl.instance);
        break;
    }

    getIt.registerLazySingleton<LocalDatabase>(
      () => LocalDatabase.instance,
    );
    Database localdatabase = await getIt<LocalDatabase>().database;
    getIt.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSourceImpl(database: localdatabase),
    );

    // app remote
    getIt.registerLazySingleton<AppRemoteDataSource>(
      () => AppRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );
    getIt.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(
        appRemoteDataSource: getIt<AppRemoteDataSource>(),
        appLocalDataSource: getIt<AppLocalDataSource>(),
      ),
    );
  }

  static void dispose() {
    getIt.reset();
  }
}
