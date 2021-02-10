import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/post.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/posts_cubit/posts_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/appbar/persistent_appbar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_card.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/create_post_prompt.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const PersistentAppbar(),
        const SliverToBoxAdapter(child: CreatePostPrompt()),
        _buildPostsState(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 16.0)),
      ],
    );
  }

  Widget _buildPostsState() {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsEmpty) {
          return _buildMessage(context, state.message);
        } else if (state is PostsError) {
          return _buildMessage(context, state.message);
        } else if (state is PostsLoaded) {
          return _buildList(state.posts.reversed.toList());
        } else {
          return _buildSliverWrapper(const CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildSliverWrapper(Widget child) {
    return SliverFillRemaining(
      child: Center(
        child: child,
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String message) {
    return _buildSliverWrapper(
      Text(
        message,
        style: context.t.headline3,
      ),
    );
  }

  Widget _buildList(List<Post> posts) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => PostCard(post: posts[index]),
        childCount: posts.length,
      ),
    );
  }
}
