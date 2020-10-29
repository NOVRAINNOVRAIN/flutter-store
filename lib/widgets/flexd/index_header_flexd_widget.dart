import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 首页滑动置顶一
class IndexFlexdHeaderWidget extends SliverPersistentHeaderDelegate {

  final List<Widget> child;
  final Color color;
  IndexFlexdHeaderWidget({this.child,this.color});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      color: color,
      child: Column(
        children: child,
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 330.h + MediaQueryData.fromWindow(window).padding.top;

  @override
  // TODO: implement minExtent
  double get minExtent => 330.h + MediaQueryData.fromWindow(window).padding.top;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

}