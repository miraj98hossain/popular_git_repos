import 'package:popular_git_repos/data/models/repositories_response.dart';

abstract class AppRepository {
  Future<List<Repository>> getRespositoris({
    required int page,
  });
}
