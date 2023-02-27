import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/constants/colors.dart';
import 'package:sample/data/app_data.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;
  const SinglePostPage({
    Key? key,
    @PathParam() required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Post.posts[postId - 1];
    print(context.router.currentPath);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.kPrimaryColor,
        leading: const AutoLeadingButton(),
      ),
      backgroundColor: post.color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                post.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
