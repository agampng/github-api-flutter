part of 'widgets.dart';

enum Categories { users, issues, repositories }

class RadioBar extends StatefulWidget {
  RadioBar({Key key}) : super(key: key);

  @override
  _RadioBarState createState() => _RadioBarState();
}

class _RadioBarState extends State<RadioBar> {
  Categories _category = Categories.users;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Radio(
          activeColor: Colors.blue,
          hoverColor: Colors.red,
          value: Categories.users,
          groupValue: _category,
          onChanged: (Categories value) {
            setState(() {
              _category = value;
            });
          },
        ),
        Text(
          'Users',
          style: TextStyle(fontSize: 16.0),
        ),
        Radio(
          value: Categories.issues,
          groupValue: _category,
          onChanged: (Categories value) {
            setState(() {
              _category = value;
            });
          },
        ),
        Text(
          'Issues',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Radio(
          value: Categories.repositories,
          groupValue: _category,
          onChanged: (Categories value) {
            setState(() {
              _category = value;
            });
          },
        ),
        Text(
          'Repositories',
          style: TextStyle(fontSize: 16.0),
        ),
      ]),
    );
  }
}
