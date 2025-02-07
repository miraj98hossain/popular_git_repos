import 'package:flutter/material.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';

import 'repo_details_view.dart';

class RepoDetailsPage extends StatelessWidget {
  const RepoDetailsPage({super.key, required this.repository});
  static const String routeName = "repo-details-page";
  static const String routePath = "/repo-details-page";
  final Repository repository;
  @override
  Widget build(BuildContext context) {
    return RepoDetailsView(repository: repository);
  }
}
