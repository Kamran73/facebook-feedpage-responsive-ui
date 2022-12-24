
import 'package:facebook_ui_flutter/widgets/profile_avatar.dart';
import 'package:facebook_ui_flutter/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> users;

  const Rooms({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: isDesktop ? const EdgeInsets.symmetric(horizontal: 5.0) : const EdgeInsets.all(0),
      elevation: isDesktop ? 1.0: 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        decoration: isDesktop ? BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ): const BoxDecoration(color: Colors.white),
        height: 60.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 4,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _createRoomButton(),
              );
            }
            final User user = onlineUsers[index-1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true,),
            );
          },
          itemCount: 1 + users.length,
        ),
      ),
    );
  }

  Widget _createRoomButton() {
    return OutlinedButton(
      onPressed: () {
        debugPrint('outlined button');
      },
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(width: 3.0, color: Colors.blueAccent),
        ),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          );
        }),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (Rect rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
