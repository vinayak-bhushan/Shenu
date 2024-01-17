import 'package:flutter/material.dart';
import 'package:skenuu_1/common/common.dart';
import 'package:skenuu_1/models/models.dart';
import 'package:skenuu_1/pages/chat_screen.dart';
import 'package:skenuu_1/pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late PageController _pageController;

  // List of pages to be displayed
  final List<Widget> pages = [
    const FeedPage(),
    const NotificationsPage(),
    ProfilePage(user: User.dummyUsers[0]),
    ChatScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = _buildPageView();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: context.responsive(
        sm: pageView,
        md: Row(
          children: [
            _navigationRail(context),
            const VerticalDivider(width: 1, thickness: 1),
            Flexible(child: pageView),
          ],
        ),
      ),
      bottomNavigationBar: context.isMobile ? _navigationBar(context) : null,
    );
  }

  void _pageChanged(int value) {
    if (_pageIndex == value && _pageController.hasClients) return;
    setState(() => _pageIndex = value);
    _pageController.jumpToPage(value);
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _pageChanged,
      children: pages,
    );
  }

  /// tablet & desktop screen
  NavigationRail _navigationRail(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return NavigationRail(
      selectedIndex: _pageIndex,
      onDestinationSelected: _pageChanged,
      extended: context.isDesktop,
      labelType: context.isDesktop
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.all,
      selectedLabelTextStyle: textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelTextStyle: textTheme.bodyMedium,
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home,
            color: theme.colorScheme.primary,
          ),
          label: const Text('Home'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.notifications_outlined),
          selectedIcon: Icon(
            Icons.notifications,
            color: theme.colorScheme.primary,
          ),
          label: const Text('Notifications'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.person_outlined),
          selectedIcon: Icon(
            Icons.person,
            color: theme.colorScheme.primary,
          ),
          label: const Text('Profile'),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.share_outlined),
          selectedIcon: Icon(
            Icons.share,
            color: theme.colorScheme.primary,
          ),
          label: const Text('Share'),
        ),
      ],
    );
  }

  /// mobile screen
  NavigationBar _navigationBar(BuildContext context) {
    final theme = Theme.of(context);
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: _pageIndex,
      height: 65,
      onDestinationSelected: _pageChanged,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home,
            color: theme.colorScheme.primary,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: const Icon(Icons.favorite_outline_sharp),
          selectedIcon: Icon(
            Icons.favorite,
            color: theme.colorScheme.primary,
          ),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: const Icon(Icons.person_outlined),
          selectedIcon: Icon(
            Icons.person,
            color: theme.colorScheme.primary,
          ),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: const Icon(Icons.chat_rounded),
          selectedIcon: Icon(
            Icons.chat_rounded,
            color: theme.colorScheme.primary,
          ),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: const Icon(Icons.share_outlined),
          selectedIcon: Icon(
            Icons.share,
            color: theme.colorScheme.primary,
          ),
          label: 'Share',
        ),
      ],
    );
  }
}
