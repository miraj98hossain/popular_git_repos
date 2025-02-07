import 'package:flutter/material.dart';
import 'package:popular_git_repos/core/extentions/extentations.dart';

import 'package:popular_git_repos/core/theme/app_theme.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';

class RepoDetailsView extends StatefulWidget {
  const RepoDetailsView({super.key, required this.repository});
  final Repository repository;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.repository.owner?.avatarUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.repository.owner?.login ?? '',
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  color: appTheme.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.repository.description ?? '',
              style: lightTextTheme.bodySmall!.copyWith(
                color: appTheme.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.repository.pushedAt != null
                  ? 'Last Updated: ${DateTime.parse(widget.repository.pushedAt!).toFormatedString("mm-dd-yyyy hh:mm a")}'
                  : '',
              style: lightTextTheme.bodySmall!.copyWith(
                color: appTheme.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                ...List.generate(widget.repository.topics?.length ?? 0,
                    (index) {
                  var topic = widget.repository.topics?[index] ?? "";
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      topic,
                      style: lightTextTheme.bodySmall!.copyWith(
                        color: appTheme.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
