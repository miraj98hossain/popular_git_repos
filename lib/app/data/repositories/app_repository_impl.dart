import 'package:popular_git_repos/app/data/data_sources/app_local_data_source.dart';
import 'package:popular_git_repos/app/data/data_sources/app_remote_data_source.dart';
import 'package:popular_git_repos/app/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource appRemoteDataSource;
  final AppLocalDataSource appLocalDataSource;

  AppRepositoryImpl({
    required this.appRemoteDataSource,
    required this.appLocalDataSource,
  });
}
