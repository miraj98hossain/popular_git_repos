import 'package:flutter/material.dart';

import 'repo_details_view.dart';

class RepoDetailsPage extends StatelessWidget {
  const RepoDetailsPage({super.key});
  static const String routeName = "repo-details-page";
  static const String routePath = "/repo-details-page";
  @override
  Widget build(BuildContext context) {
    return const RepoDetailsView();
  }
}
