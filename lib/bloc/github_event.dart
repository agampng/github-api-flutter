part of 'github_bloc.dart';

abstract class GithubEvent extends Equatable {
  const GithubEvent();
}

class EventGithubInitial extends GithubEvent {
  final String query;
  final int page;
  final String type;
  final bool isLazy;

  EventGithubInitial({this.query, this.page, this.type, this.isLazy});

  @override
  List<Object> get props => [];
}

class EventOnUsersMore extends GithubEvent {
  @override
  List<Object> get props => [];
}
