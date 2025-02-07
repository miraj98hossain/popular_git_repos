import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';
import 'package:popular_git_repos/presentations/home/home.dart';
import 'package:popular_git_repos/presentations/repo_details/view/repo_details_page.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomePage.routePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const HomePage(),
          state: state,
        ),
        routes: [
          GoRoute(
            path: RepoDetailsPage.routePath,
            name: RepoDetailsPage.routeName,
            pageBuilder: (context, state) {
              return getPage(
                child: RepoDetailsPage(
                  repository: state.extra as Repository,
                ),
                state: state,
              );
            },
          ),
        ],
      ),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
