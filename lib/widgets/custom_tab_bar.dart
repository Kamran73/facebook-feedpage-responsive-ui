import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  var onPressed;
  final bool isBottom;

  CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onPressed,
    required this.isBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: isBottom
          ? const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              ),
            )
          : const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              ),
            ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onPressed,
    );
  }
}
