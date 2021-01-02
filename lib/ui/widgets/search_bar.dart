part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 18, vertical: context.responsive(8)),
      margin: margin,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, size: context.responsive(26)),
          HSpacer(14),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (String val) {
                context.read<GithubBloc>().add(
                    EventGithubInitial(query: val, page: 1, type: 'users'));
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search username, issue, repository',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HSpacer extends SizedBox {
  const HSpacer(double size) : super(width: size);
}
