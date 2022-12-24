
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../desktop_widgets/contacts_list.dart';
import '../desktop_widgets/more_options_list.dart';
import '../widgets/circle_button.dart';
import '../widgets/create_post_container.dart';
import '../widgets/post_container.dart';
import '../widgets/responsive.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          desktop: _Desktop(controller: _scrollController),
          mobile: _HomeScreenMobile(controller: _scrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            CircleButton(
              iconData: Icons.search,
              size: 30.0,
              onPressed: () => debugPrint('search'),
            ),
            CircleButton(
              //iconData: FontAwesomeIcons.facebookMessenger,
              iconData: MdiIcons.facebookMessenger,
              size: 30.0,
              onPressed: () => debugPrint('messenger'),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: CreatePostContainer(
            user: currentUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(users: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              stories: stories,
              user: currentUser,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PostContainer(
                post: posts[index],
              );
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: MoreOptionsList(user: currentUser),
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    stories: stories,
                    user: currentUser,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CreatePostContainer(
                  user: currentUser,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Rooms(users: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return PostContainer(
                      post: posts[index],
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ContactsList(users: onlineUsers),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
