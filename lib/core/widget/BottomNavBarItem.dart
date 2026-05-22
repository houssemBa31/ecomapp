import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Color, Icon;

@immutable
class BottomNavBarItem {
  final String title;
  final Icon icon;
  final Color? activeColor;


  const BottomNavBarItem(
      this.title,
      this.icon, {
        required this.activeColor,
      });
}