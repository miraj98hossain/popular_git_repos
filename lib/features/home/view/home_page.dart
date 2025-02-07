import 'package:flutter/material.dart';
import 'package:popular_git_repos/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";
  static const String routePath = "/home-page";
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
