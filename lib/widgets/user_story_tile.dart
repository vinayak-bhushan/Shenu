import 'package:flutter/material.dart';
import 'package:skenuu_1/common/common.dart';
import 'package:skenuu_1/models/models.dart';
import 'package:skenuu_1/pages/user_story_page.dart';
import 'package:skenuu_1/widgets/user_story_avatar.dart';

class UserStoryTile extends StatelessWidget {
  const UserStoryTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final UserStory userStory = UserStory.dummyUserStories[index];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: UserStoryAvatar(
            userStory: userStory,
            onTap: () => context.push(route: UserStoryPage.route(index)),
          ),
        ),
        SizedBox(
          width: 75,
          child: Text(
            userStory.owner.username,
            textAlign: TextAlign.center,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
