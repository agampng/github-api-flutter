part of 'widgets.dart';

class RadioBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: BlocBuilder<GithubBloc, GithubState>(builder: (_, catState) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Radio(
            value: "OnUsersLoad",
            groupValue: catState.toString(),
            onChanged: (_) => context
                .read<GithubBloc>()
                .add(EventGithubInitial(type: "users", page: 1)),
          ),
          Text(
            'Users',
            style: TextStyle(fontSize: 16.0),
          ),
          Radio(
            value: "OnIssues",
            groupValue: catState.toString(),
            onChanged: (String value) {
              context
                  .read<GithubBloc>()
                  .add(EventGithubInitial(type: "issues", page: 1));
            },
          ),
          Text(
            'Issues',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Radio(
            value: "OnRepositories",
            groupValue: catState.toString(),
            onChanged: (String value) {
              context
                  .read<GithubBloc>()
                  .add(EventGithubInitial(type: "repositories", page: 1));
            },
          ),
          Text(
            'Repositories',
            style: TextStyle(fontSize: 16.0),
          ),
        ]);
      }),
    );
  }
}
