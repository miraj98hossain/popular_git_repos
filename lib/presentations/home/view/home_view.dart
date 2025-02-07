import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:popular_git_repos/core/extentions/extentations.dart';

import 'package:popular_git_repos/core/theme/app_theme.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';
import 'package:popular_git_repos/presentations/home/bloc/repository_list_bloc.dart';
import 'package:popular_git_repos/presentations/repo_details/view/repo_details_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _doclistScrollController = ScrollController();
  @override
  void initState() {
    context.read<RepositoryListBloc>().add(RepositoryListGet());
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
          'Popular Git Repos',
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
          children: [
            Expanded(
              child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
                builder: (context, state) {
                  if (state.isLoading && state.repositoryList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.repositoryList.isNotEmpty) {
                    return CustomScrollView(
                      controller: _doclistScrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: state.repositoryList.length,
                          itemBuilder: (context, index) {
                            var repo = state.repositoryList[index];

                            return GestureDetector(
                              onTap: () {
                                context.pushNamed(RepoDetailsPage.routeName);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: appTheme.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          repo.owner?.avatarUrl ?? "",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            repo.fullName ?? "",
                                            style: lightTextTheme.bodyMedium!
                                                .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      repo.description ?? "",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: repo.language != null,
                                          child: Row(
                                            children: [
                                              Text(
                                                repo.language ?? "",
                                                style: lightTextTheme.bodySmall!
                                                    .copyWith(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              '${((repo.stargazersCount ?? 0) / 1000).truncate()}K',
                                              style: lightTextTheme.bodySmall!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _getUpdateAtString(repo),
                                          style: lightTextTheme.bodySmall!
                                              .copyWith(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        if (state.isLoading)
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 64,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getUpdateAtString(Repository repo) {
    {
      if (repo.pushedAt != null) {
        var duration = DateTime.now()
            .toLocal()
            .difference(DateTime.parse(repo.pushedAt!).toLocal());

        if (duration.inDays > 0 && duration.inDays <= 20) {
          return "Updated ${duration.inDays} days ago";
        } else if (duration.inDays > 20) {
          return "Updated ${DateTime.parse(repo.pushedAt!).toFormatedString("MMM d, yyyy")}  ago";
        } else if (duration.inDays == 0 && duration.inHours > 0) {
          return "Updated ${duration.inHours} hours ago";
        } else if (duration.inHours == 0 && duration.inMinutes > 0) {
          return "Updated ${duration.inMinutes} minutes ago";
        }
      }
      return "";
    }
  }
}
