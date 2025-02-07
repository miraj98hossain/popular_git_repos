import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_git_repos/dependency_injector/di_container.dart';
import 'package:popular_git_repos/presentations/home/bloc/repository_list_bloc.dart';
import 'package:popular_git_repos/presentations/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";
  static const String routePath = "/home-page";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryListBloc(getService()),
      child: const HomeView(),
    );
  }
}
