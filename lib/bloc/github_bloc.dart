import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sejutacita_test/models/models.dart';
import 'package:sejutacita_test/repositories/github_repositories.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(OnUsersLoad(isLazy: true));
  GithubRepository _githubRepository = GithubRepository();
  List<Item> githubList = [];
  List<IssuesItem> githubIssuesList = [];
  List<RepositoriesItem> githubRepositoriesList = [];
  String query;
  String type;
  int page;

  bool _isInfiniteLoad = true;
  bool get isInfiniteLoad => _isInfiniteLoad;
  set isInfiniteLoad(bool data) {
    _isInfiniteLoad = data;
  }

  @override
  Stream<GithubState> mapEventToState(
    GithubEvent event,
  ) async* {
    if (event is EventGithubInitial) {
      page = event.page ?? page;
      query = event.query?.trim() ?? query;
      type = event.type ?? type;
      githubIssuesList = [];
      githubList = [];
      githubRepositoriesList = [];
      _isInfiniteLoad = event.isLazy ?? true;
      if (type == "users") {
        List<Item> _fetchData =
            await _githubRepository.fetchGithubUsersList(query, type, page);
        githubList.addAll(_fetchData);
        yield OnUsersLoad(githubUsers: githubList, isLazy: _isInfiniteLoad);
      } else if (type == "issues") {
        List<IssuesItem> _fetchData =
            await _githubRepository.fetchGithubUsersList(query, type, page);
        githubIssuesList.addAll(_fetchData);
        yield OnIssues(githubIssues: githubIssuesList, isLazy: _isInfiniteLoad);
      } else if (type == "repositories") {
        List<RepositoriesItem> _fetchData =
            await _githubRepository.fetchGithubUsersList(query, type, page);
        githubRepositoriesList.addAll(_fetchData);
        yield OnRepositories(
            githubRepositories: githubRepositoriesList,
            isLazy: _isInfiniteLoad);
      }
    } else if (event is EventOnUsersMore) {
      if (type == "users") {
        List<Item> _fetchData = await _githubRepository.fetchGithubUsersList(
            query, type, page += 1);
        githubList.addAll(_fetchData);
        yield null;
        yield OnUsersLoad(githubUsers: githubList, isLazy: _isInfiniteLoad);
      } else if (type == "issues") {
        List<IssuesItem> _fetchData = await _githubRepository
            .fetchGithubUsersList(query, type, page += 1);
        githubIssuesList.addAll(_fetchData);
        yield null;
        yield OnIssues(githubIssues: githubIssuesList, isLazy: _isInfiniteLoad);
      } else if (type == "repositories") {
        List<RepositoriesItem> _fetchData = await _githubRepository
            .fetchGithubUsersList(query, type, page += 1);
        githubRepositoriesList.addAll(_fetchData);
        yield null;
        yield OnRepositories(
            githubRepositories: githubRepositoriesList,
            isLazy: _isInfiniteLoad);
      }
    }
  }
}
