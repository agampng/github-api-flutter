part of 'github_bloc.dart';

abstract class GithubState extends Equatable {
  const GithubState();
}

class GithubInitial extends GithubState {
  @override
  List<Object> get props => [];
}

class OnUsersLoad extends GithubState {
  final List<Item> githubUsers;
  final bool isLazy;
  OnUsersLoad({this.githubUsers, this.isLazy});
  @override
  List<Object> get props => [githubUsers];
}

class OnIssues extends GithubState {
  final List<IssuesItem> githubIssues;
  final bool isLazy;
  OnIssues({this.githubIssues, this.isLazy});
  @override
  List<Object> get props => [githubIssues];
}

class OnRepositories extends GithubState {
  final List<RepositoriesItem> githubRepositories;
  final bool isLazy;
  OnRepositories({this.githubRepositories, this.isLazy});
  @override
  List<Object> get props => [githubRepositories];
}
