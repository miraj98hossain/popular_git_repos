import 'package:flutter/material.dart';

import 'package:popular_git_repos/core/theme/app_theme.dart';

class RepoDetailsView extends StatefulWidget {
  const RepoDetailsView({super.key});

  @override
  State<RepoDetailsView> createState() => _RepoDetailsViewState();
}

class _RepoDetailsViewState extends State<RepoDetailsView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: appTheme.white,
        centerTitle: true,
        title: Text(
          'Repository Details',
          style: lightTextTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
