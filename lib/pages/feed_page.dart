import 'package:flutter/material.dart';
import 'package:skenuu_1/models/models.dart';
import 'package:skenuu_1/pages/chat_screen.dart';
import 'package:skenuu_1/widgets/widgets.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  void navigateToChatScreen(BuildContext context) {
    // Navigate to the ChatScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _appBar(theme, context),
      body: ResponsivePadding(
        child: ListView(
          children: [
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: UserStory.dummyUserStories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 4 : 0,
                      right: index == UserStory.dummyUserStories.length - 1 ? 4 : 0,
                    ),
                    child: UserStoryTile(index: index),
                  );
                },
              ),
            ),
            ListView.separated(
              itemCount: Post.dummyPosts.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 4),
              ),
              itemBuilder: (context, index) {
                return PostCard(post: Post.dummyPosts[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(ThemeData theme, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: ResponsivePadding(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => navigateToChatScreen(context),
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 120),
                Center(
                  child: Row(
                    children: [
                      const AppLogo(),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => navigateToChatScreen(context),
                  icon: Icon(
                    Icons.send_sharp,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
