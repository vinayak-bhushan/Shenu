import 'package:flutter/material.dart';
import 'package:skenuu_1/common/common.dart';
import 'package:skenuu_1/models/models.dart';

class UserPostsTabView extends StatelessWidget {
  const UserPostsTabView({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.window_sharp)),
              Tab(icon: Icon(Icons.favorite_border_outlined)),
              Tab(icon: Icon(Icons.lock_clock_outlined)),
            ],
          ),
          SizedBox(
            height: context.isMobile
                ? (context.width / 3) * (posts.length / 3).ceil() + 16
                : (context.width * .234) * (posts.length / 3).ceil(),
            child: TabBarView(
              children: [
                _postsGridView(context),
                _postsGridView(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postsGridView(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      shrinkWrap: true,
      itemCount: posts.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            posts[index].postImage,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
