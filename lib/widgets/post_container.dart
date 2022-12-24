import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_flutter/widgets/profile_avatar.dart';
import 'package:facebook_ui_flutter/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: isDesktop ? 5.0 : 0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: isDesktop ? BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ): const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != 'null'
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        ),
                ],
              ),
            ),
            post.imageUrl != 'null'
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            _PostStats(post: post),
            const Divider(),
            Row(
              children: [
                _PostButtons(
                  icon: const Icon(MdiIcons.thumbUpOutline),
                  onPressed: () {},
                  size: 16.0,
                  label: 'Like',
                ),
                _PostButtons(
                  icon: const Icon(MdiIcons.commentOutline),
                  onPressed: () {},
                  size: 16.0,
                  label: 'Comment',
                ),
                _PostButtons(
                  icon: const Icon(MdiIcons.shareOutline),
                  onPressed: () {},
                  size: 16.0,
                  label: 'Like',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PostButtons extends StatelessWidget {
  var onPressed;
  final double size;
  final Icon icon;
  final String label;

  _PostButtons(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.size,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
          isViewed: true,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                    letterSpacing: 0.6),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Row(
                children: [
                  Text('${post.timeAgo}  '),
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          color: Colors.grey[600],
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 6, top: 4, right: 8, bottom: 4),
            decoration: const BoxDecoration(
              color: Palette.facebookBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 10.0,
            ),
          ),
          Expanded(
            child: Text(
              '${post.likes}',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Text(
            '${post.comments} Comments',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            '${post.shares} Shares',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
