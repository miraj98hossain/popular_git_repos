import 'package:popular_git_repos/app/cubit/internet_checker_cubit.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';

abstract class AppRepository {
  Future<List<Repository>> getRespositoris({
    required int page,
    required ConnectionStatus status,
  });
  Future<void> insertOrUpdateRepositoryToLocal(Repository repository);
  Future<List<Repository>> getRepositoriesFromLocal(
      {int limit = 10, int offset = 0});
}
