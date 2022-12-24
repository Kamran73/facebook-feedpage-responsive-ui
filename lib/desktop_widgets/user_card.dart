import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../widgets/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(
          imageUrl: user.imageUrl,
          isViewed: true,
          isActive: false,
        ),
        const SizedBox(
          width: 7.0,
        ),
        Flexible(
          child: Text(
            user.name,
            style: const TextStyle(fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
