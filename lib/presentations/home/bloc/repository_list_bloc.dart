import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_git_repos/data/models/repositories_response.dart';
import 'package:popular_git_repos/domain/repositories/app_repository.dart';

@immutable
sealed class RepositoryListEvent {}

final class RepositoryListGet extends RepositoryListEvent {
  final int? page;

  RepositoryListGet({this.page});
}

class RepositoryListState {
  final bool isInitial;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final List<Repository> repositoryList;

  const RepositoryListState({
    this.isInitial = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    required this.repositoryList,
  });

  RepositoryListState copyWith({
    bool? isInitial,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    List<Repository>? repositoryList,
  }) {
    return RepositoryListState(
      isInitial: isInitial ?? this.isInitial,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      repositoryList: repositoryList ?? this.repositoryList,
    );
  }
}

class RepositoryListBloc
    extends Bloc<RepositoryListEvent, RepositoryListState> {
  final AppRepository _repository;
  int page = 0;
  RepositoryListBloc(this._repository)
      : super(RepositoryListState(isInitial: true, repositoryList: [])) {
    on<RepositoryListGet>((event, emit) async {
      emit(state.copyWith(
        isInitial: false,
        isLoading: true,
        isError: false,
        errorMessage: '',
      ));
      try {
        page++;
        if (page <= 100) {
          var response = await _repository.getRespositoris(page: page);
          emit(
            state.copyWith(
              isLoading: false,
              repositoryList: response,
            ),
          );
        } else {
          emit(state);
        }
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
