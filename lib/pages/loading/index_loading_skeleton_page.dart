import 'package:demo1/widgets/component/custom_skeleton_container.dart';
import 'package:demo1/widgets/component/custom_skeleton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///首页的加载骨架屏
///

class IndexLoadingSkeletonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Skeleton(
          child: Container(
            height: 140.h,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: 5.0, right: 50.w, top: 8.0, bottom: 8.0),
            child: Skeleton(
              child: Container(
                width: 140.w,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTabItemSkeleton(context),
                        _buildTabItemSkeleton(context),
                        _buildTabItemSkeleton(context),
                        _buildTabItemSkeleton(context),
                        _buildTabItemSkeleton(context),
                        _buildTabItemSkeleton(context),
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    Skeleton(
                      child: Container(
                        height: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height * 320,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabItemSkeleton(BuildContext context) {
    double pw = MediaQuery.of(context).size.width;
    pw = pw - 100.w;
    double w = pw / 6 -50.w;
    return Container(
      child: Skeleton(
        child: Container(
          width: w,
          height: 100.h,
        ),
      ),
    );
  }
}
