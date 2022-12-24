
import 'package:facebook_ui_flutter/desktop_widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/user_model.dart';
import '../widgets/circle_button.dart';
import '../widgets/custom_tab_bar.dart';

class CustomAppBar extends StatelessWidget {
  final User user;
  final List<IconData> icons;
  var onTap;
  final int selectedIndex;
  final bool isBottom;
  CustomAppBar({
    Key? key,
    required this.user,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
                icons: icons, selectedIndex: selectedIndex, onPressed: onTap, isBottom: isBottom,),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const UserCard(user: currentUser,),
                CircleButton(
                  size: 30.0,
                  iconData: Icons.search,
                  onPressed: (){},
                ),
                CircleButton(
                  size: 30.0,
                  iconData: MdiIcons.facebookMessenger,
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
