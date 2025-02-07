import 'package:flutter/material.dart';

import 'package:popular_git_repos/core/route/router.dart';
import 'package:popular_git_repos/core/theme/app_theme.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Delta Hospital',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppNavigation.router,
    );
  }
}
