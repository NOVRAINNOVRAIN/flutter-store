import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 自定义选择项目工具条
class CustomSelectToolbar extends StatefulWidget {
  final List<SelectMenu> items;
  final int select;
  final bool hideSubTitle;

  CustomSelectToolbar({this.items, this.select, this.hideSubTitle});

  @override
  _CustomSelectToolbarState createState() => _CustomSelectToolbarState();
}

class _CustomSelectToolbarState extends State<CustomSelectToolbar>
    with AfterLayoutMixin<CustomSelectToolbar> {
  @override
  Widget build(BuildContext context) {
    bool hide = widget.hideSubTitle;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
          child: getItemSize() > 4
              ? Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.items
                          .map((f) => _buildItemWidget(f, hide, widget.select))
                          .toList(),
                    ),
                  ),
                )
              : Container(
                  child: Row(
                    children: widget.items
                        .map((f) => _buildItemWidget(f, hide, widget.select))
                        .toList(),
                  ),
                ),
        ),
      ],
    );
  }

  // 高亮选中项目
  Color _buildPrimaryColor(int index) {
    if (index == widget.select) {
      return Colors.redAccent;
    }
    return Colors.black;
  }

  Widget _buildItemWidget(
      SelectMenu selectMenu, bool hideSubTitle, int select) {
    Widget widget = Container(
      width: getItemWidgetWidth(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPadding(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(top: hideSubTitle ? 0 : 0),
              child: Text(
                selectMenu.title,
                style: TextStyle(
                    color: _buildPrimaryColor(getIndexNumber(selectMenu)),
                    fontSize: 60.sp),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: hideSubTitle ? 0.0 : 1.0,
              child: Visibility(
                visible: !hideSubTitle,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: getIndexNumber(selectMenu) == select
                          ? BorderRadius.all(Radius.circular(15.0))
                          : null,
                      color: getIndexNumber(selectMenu) == select
                          ? Colors.redAccent
                          : Colors.transparent),
                  child: Text(
                    selectMenu.subTitle,
                    style: TextStyle(
                        fontSize: 45.sp,
                        color: getIndexNumber(selectMenu) == select
                            ? Colors.white
                            : Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Stack(
      children: [
        widget,
        Positioned(
          bottom: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: hideSubTitle ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Container(
                alignment: Alignment.center,
                width: getItemWidgetWidth(),
                child: Container(
                  width: 120.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color:   getIndexNumber(selectMenu) == select ? Colors.redAccent : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                ),
            ),
          ),
        )
      ],
    );
  }

  int getIndexNumber(SelectMenu selectMenu) {
    int index = 0;
    for (int i = 0; i <= widget.items.length; i++) {
      SelectMenu item = widget.items[i];
      if (item.subTitle == selectMenu.subTitle &&
          item.title == selectMenu.title) {
        index = i;
        break;
      }
    }
    return index;
  }

  int getItemSize() => widget.items.length; // 获取item的长度

  // 计算每个item的宽度
  double getItemWidgetWidth() {
    double ww = MediaQuery.of(context).size.width - 100.w;
    if (widget.items.isNotEmpty) {
      switch (getItemSize()) {
        case 1:
          return ww;
          break;
        case 2:
          return ww / 2;
          break;
        case 3:
          return ww / 3;
          break;
        case 4:
          return ww / 4;
          break;
        default:
          // 使用滑动组件
          return ww / 4;
          break;
      }
    }
    return 0;
  }

  @override
  void afterFirstLayout(BuildContext context) {}
}

class SelectMenu {
  String title;
  String subTitle;

  SelectMenu({this.title, this.subTitle});
}
