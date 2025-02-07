import 'package:http/http.dart' as http;
import 'package:popular_git_repos/core/app_config.dart';
import 'package:popular_git_repos/core/services/decoder_service_mixin.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';

abstract class AppRemoteDataSource {
  Future<RepositoriesResponse> getRespositoris({
    String query = 'android',
    String sort = 'stars',
    required int page,
    int perPage = 10,
  });
}

class AppRemoteDataSourceImpl
    with DecoderServiceMixin
    implements AppRemoteDataSource {
  final AppConfig _appConfig;

  AppRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<RepositoriesResponse> getRespositoris({
    String query = 'android',
    String sort = 'stars',
    required int page,
    int perPage = 10,
  }) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}search/repositories?q=$query&sort=$sort&page=$page&per_page=$perPage'));

    http.StreamedResponse response = await request.send();
    return await decodeResponse<RepositoriesResponse>(response,
        decoder: RepositoriesResponse.fromJson);
  }
}
