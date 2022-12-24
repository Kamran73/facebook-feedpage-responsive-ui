import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool isViewed;
  const ProfileAvatar({Key? key, required this.imageUrl, this.isActive = false, this.isViewed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: isViewed ? 20.0 : 17.0,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive ? Positioned(
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.online,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
          ),
          bottom: 0.0,
          right: 0.0,
        )
        : const SizedBox.shrink(),
      ],
    );
  }
}
