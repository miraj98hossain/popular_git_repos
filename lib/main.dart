import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_git_repos/app/bloc/app_bloc_observer.dart';
import 'package:popular_git_repos/app/view/app_page.dart';
import 'package:popular_git_repos/dependency_injector/di_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await DIContainer.configureServices(env: "test");
  Bloc.observer = const AppBlocObserver();
  runApp(const AppPage());
}
