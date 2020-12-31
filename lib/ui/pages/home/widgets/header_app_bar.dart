part of '../../pages.dart';

class _HeaderAppBar extends StatelessWidget {
  static const double heightFraction = 0.48;

  const _HeaderAppBar({
    @required this.height,
    @required this.showTitle,
  });

  final double height;
  final bool showTitle;

  Widget _buildTitle(visible) {
    if (!visible) {
      return null;
    }

    return Container(
      padding: EdgeInsets.only(
        top: 28,
      ),
      child: Column(
        children: [
          RadioBar(),
          ButtonFilterBar(),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: context.responsive(40),
          ),
          child: Column(
            children: [
              Row(
                children: [],
              ),
              Row(
                children: [],
              )
            ],
          )),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: HeaderBackground(
        buildChildren: (_) => [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              VSpacer(context.responsive(60) + context.padding.top),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'What you want\nto find on Github?',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.4 * context.responsive(30) / 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              VSpacer(context.responsive(28)),
              SearchBar(),
              RadioBar(),
              ButtonFilterBar(),
              // _buildCategories(context),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      floating: true,
      pinned: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      collapsedHeight: height / 2.2,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: _buildTitle(showTitle),
        background: _buildCard(context),
      ),
    );
  }
}

class VSpacer extends SizedBox {
  const VSpacer(double size) : super(height: size);
}
