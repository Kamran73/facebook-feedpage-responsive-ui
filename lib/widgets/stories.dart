import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_flutter/widgets/profile_avatar.dart';
import 'package:facebook_ui_flutter/widgets/responsive.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';

class Stories extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const Stories({Key? key, required this.stories, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent: Colors.white,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _StoryCard(story: story),
          );
        },
        itemCount: stories.length + 1,
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: double.infinity,
            width: 110,
            decoration: Responsive.isDesktop(context) ? BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0,2),
                    blurRadius: 4.0,
                  ),
                ]
            ): BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                  ),
                  child: const Icon(
                    Icons.add,
                    color: Palette.facebookBlue,
                    size: 30.0,
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  isViewed: story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 20.0,
          left: 8.0,
          right: 8.0,
          child: isAddStory
              ? const Text(
                  'Add Story',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              : Text(
                  story!.user.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
        ),
      ],
    );
  }
}
