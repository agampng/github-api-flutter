part of '../../pages.dart';

class _ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        // _buildHeader(context),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 20,
          separatorBuilder: (context, index) => Divider(),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Two-line ListTile'),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
      ],
    );
  }
}
