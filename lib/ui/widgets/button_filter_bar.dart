part of 'widgets.dart';

class ButtonFilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: context.responsive(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              onPressed: () {},
              child:
                  const Text('Lazy Loading', style: TextStyle(fontSize: 12))),
          RaisedButton(
              color: Color(0xFF0366D6),
              onPressed: () {},
              child: const Text('With Index',
                  style: TextStyle(fontSize: 12, color: Colors.white))),
        ],
      ),
    );
  }
}
