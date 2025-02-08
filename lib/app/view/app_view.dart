import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_git_repos/app/cubit/internet_checker_cubit.dart';

import 'package:popular_git_repos/core/route/router.dart';
import 'package:popular_git_repos/core/theme/app_theme.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => InternetCheckerCubit(),
      child: MaterialApp.router(
        title: 'Delta Hospital',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
