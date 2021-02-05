import 'package:flutter/material.dart';

import 'package:youtube_clone/core/constants/images.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/theme_cubit/theme_cubit.dart';
import 'package:youtube_clone/ui/styles/app_colors.dart';

import 'package:youtube_clone/ui/widgets/appbar/appbar_icon.dart';
import 'package:youtube_clone/ui/widgets/appbar/video_search_delegate.dart';

class PersistentAppbar extends StatelessWidget {
  final PreferredSizeWidget bottom;

  const PersistentAppbar({
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      bottom: bottom,
      elevation: 2.0,
      forceElevated: true,
      shadowColor: AppColors.dark.withOpacity(0.4),
      title: Row(
        children: [
          _buildLogo(),
          const Spacer(),
          const AppbarIcon(icon: Icons.notifications_outlined),
          AppbarIcon(
            icon: Icons.search,
            onTap: () =>
                showSearch(context: context, delegate: VideoSearchDelegate()),
          ),
          AppbarIcon(
            icon: Icons.account_circle,
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final imageUrl =
            themeMode == ThemeMode.dark ? Images.logoDark : Images.logoLight;
        return Image.asset(imageUrl, height: 24.0);
      },
    );
  }
}
