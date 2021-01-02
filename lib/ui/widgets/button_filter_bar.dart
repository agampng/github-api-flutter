part of 'widgets.dart';

class ButtonFilterBar extends StatelessWidget {
  GithubBloc _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<GithubBloc>(context);

    return Padding(
        padding: EdgeInsets.only(
          left: 28,
          right: 28,
          bottom: context.responsive(22),
        ),
        child:
            BlocBuilder<GithubBloc, GithubState>(builder: (context, loadState) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  color: _bloc.isInfiniteLoad ? Color(0xFF0366D6) : Colors.grey,
                  onPressed: () {
                    context
                        .read<GithubBloc>()
                        .add(EventGithubInitial(isLazy: true));
                  },
                  child: const Text('Lazy Loading',
                      style: TextStyle(fontSize: 12, color: Colors.white))),
              RaisedButton(
                  color:
                      !_bloc.isInfiniteLoad ? Color(0xFF0366D6) : Colors.grey,
                  onPressed: () {
                    context
                        .read<GithubBloc>()
                        .add(EventGithubInitial(isLazy: false));
                  },
                  child: const Text('With Index',
                      style: TextStyle(fontSize: 12, color: Colors.white))),
            ],
          );
        }));
  }
}
