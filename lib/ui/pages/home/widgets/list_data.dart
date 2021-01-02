part of '../../pages.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  ScrollController _scrollController = ScrollController();
  GithubBloc _bloc;
  List<int> items = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<GithubBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          _bloc.isInfiniteLoad) {
        _bloc.add(EventOnUsersMore());
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<GithubBloc>(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          BlocBuilder<GithubBloc, GithubState>(
            builder: (context, githubState) {
              if (githubState is OnUsersLoad &&
                  githubState.githubUsers != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: githubState.githubUsers.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Card(
                        child: ListTile(
                      leading: Image.network(
                          githubState.githubUsers[index].avatarUrl),
                      title: Text(githubState.githubUsers[index].login),
                      subtitle:
                          Text(githubState.githubUsers[index].id.toString()),
                    ));
                  },
                );
              } else if (githubState is OnIssues &&
                  githubState.githubIssues != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: githubState.githubIssues.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Card(
                        child: ListTile(
                      title: Text(
                          "Title: ${githubState.githubIssues[index].title}"),
                      subtitle: Text(
                          githubState.githubIssues[index].createdAt.toString()),
                      trailing: Text(
                        githubState.githubIssues[index].state,
                        style: TextStyle(color: Colors.green),
                      ),
                    ));
                  },
                );
              } else if (githubState is OnIssues &&
                  githubState.githubIssues != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: githubState.githubIssues.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Card(
                        child: ListTile(
                      title: Text(
                          "Title: ${githubState.githubIssues[index].title}"),
                      subtitle: Text(
                          githubState.githubIssues[index].createdAt.toString()),
                      trailing: Text(
                        githubState.githubIssues[index].state,
                        style: TextStyle(color: Colors.green),
                      ),
                    ));
                  },
                );
              } else if (githubState is OnRepositories &&
                  githubState.githubRepositories != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: githubState.githubRepositories.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Card(
                        child: ListTile(
                      title: Text(
                          "Repository: ${githubState.githubRepositories[index].fullName}"),
                      subtitle: Text("⭐️ " +
                          githubState.githubRepositories[index].stargazersCount
                              .toString()),
                      trailing: Text(
                        "Forks: " +
                            githubState.githubRepositories[index].forks
                                .toString(),
                        style: TextStyle(color: Colors.pink),
                      ),
                    ));
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
          BlocBuilder<GithubBloc, GithubState>(
            builder: (context, loadState) {
              return Container(
                  child: _bloc.isInfiniteLoad &&
                          (_bloc.githubList.length >= 10 ||
                              _bloc.githubIssuesList.length >= 10 ||
                              _bloc.githubRepositoriesList.length >= 10)
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator()),
                          ),
                        )
                      : (_bloc.githubList.length >= 10 ||
                              _bloc.githubIssuesList.length >= 10 ||
                              _bloc.githubRepositoriesList.length >= 10)
                          ?
                          // page pagintate
                          Container(
                              height: 20.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<GithubBloc>().add(
                                            EventGithubInitial(
                                                page: items[index],
                                                isLazy: false));
                                        _scrollController.animateTo(
                                          0.0,
                                          curve: Curves.easeOut,
                                          duration:
                                              const Duration(milliseconds: 300),
                                        );
                                      },
                                      child: Text(
                                        '${items[index]}',
                                        style: TextStyle(
                                            color: (_bloc.page == items[index])
                                                ? Colors.black
                                                : Colors.blue,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Divider(),
                            ));
            },
          ),
        ],
      ),
    );
  }
}
