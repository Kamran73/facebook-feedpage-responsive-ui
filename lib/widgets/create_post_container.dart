
import 'package:facebook_ui_flutter/widgets/profile_avatar.dart';
import 'package:facebook_ui_flutter/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';
import 'flat_button_icon.dart';

class CreatePostContainer extends StatelessWidget {
  final User user;
  const CreatePostContainer({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0: 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        decoration: isDesktop ? BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ): const BoxDecoration(color: Colors.white),
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0, ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 10.0,
            ),
            SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  FlatButtonIcon(icon: Icons.videocam, color: Colors.red, title: 'Live',),
                  VerticalDivider(width: 8.0,),
                  FlatButtonIcon(icon: Icons.photo_library, color: Colors.green, title: 'Photo',),
                  VerticalDivider(width: 8.0,),
                  FlatButtonIcon(icon: Icons.video_call,color: Colors.purpleAccent, title: 'Room',)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
