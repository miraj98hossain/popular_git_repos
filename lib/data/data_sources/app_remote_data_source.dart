import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:popular_git_repos/core/app_config.dart';
import 'package:popular_git_repos/core/services/decoder_service_mixin.dart';

abstract class AppRemoteDataSource {}

class AppRemoteDataSourceImpl
    with DecoderServiceMixin
    implements AppRemoteDataSource {
  final AppConfig _appConfig;

  AppRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;
}
