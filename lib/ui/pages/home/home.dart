part of '../pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  double appBarHeight = 0;
  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;

    setState(() {
      showTitle = offset > appBarHeight - kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = context.screenSize.height * HeaderAppBar.heightFraction;

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          HeaderAppBar(
            height: appBarHeight,
            showTitle: showTitle,
          ),
        ],
        body: ListData(),
      ),
    );
  }
}
