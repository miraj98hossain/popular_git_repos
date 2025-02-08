import 'package:popular_git_repos/app/cubit/internet_checker_cubit.dart';
import 'package:popular_git_repos/data/data_sources/app_local_data_source.dart';
import 'package:popular_git_repos/data/data_sources/app_remote_data_source.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';
import 'package:popular_git_repos/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource appRemoteDataSource;
  final AppLocalDataSource appLocalDataSource;

  AppRepositoryImpl({
    required this.appRemoteDataSource,
    required this.appLocalDataSource,
  });
  @override
  Future<List<Repository>> getRespositoris({
    required int page,
    required ConnectionStatus status,
  }) async {
    if (status == ConnectionStatus.connected) {
      var response = await appRemoteDataSource.getRespositoris(
        page: page,
      );
      for (var repo in response.items ?? []) {
        await appLocalDataSource.insertOrUpdateRepository(repo);
      }
      return response.items ?? [];
    } else {
      return await appLocalDataSource.getRepositories(offset: (page - 1) * 10);
    }
  }

  @override
  Future<void> insertOrUpdateRepositoryToLocal(Repository repository) async {
    await appLocalDataSource.insertOrUpdateRepository(repository);
  }

  @override
  Future<List<Repository>> getRepositoriesFromLocal(
      {int limit = 10, int offset = 0}) async {
    return await appLocalDataSource.getRepositories(
        limit: limit, offset: offset);
  }
}
