import 'package:demo1/modals/goods_detail_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/detail_simple_bborder_button.dart';

class DetailImagesWidget extends StatelessWidget {
  final String images;

  DetailImagesWidget({this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10, bottom: 10.0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          // 文字
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DetailSimpleBorderButton(text: "详情", is_current: true),
                DetailSimpleBorderButton(text: "推荐", is_current: false)
              ],
            ),
          ),
          images != null
              ? Column(
                  children: _bulidImagesList(),
                )
              : Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text("暂无图文"),
                  )),
          Container(
            height: ScreenUtil().setHeight(200),
          )
        ],
      ),
    );
  }

  List<Widget> _bulidImagesList() {
    List<Widget> imagesWidget = [];
    if (images != "" && images != null) {
      List imagesArr = _getImageList();
      for (DetailImage item in imagesArr) {
        String src = _getUrl(item.img);
        imagesWidget.add(ExtendedImage.network(
          src,
          fit: BoxFit.fill,
          cache: true,
          border: Border.all(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          //cancelToken: cancellationToken,
        ));
      }
    }
    return imagesWidget;
  }

  List<DetailImage> _getImageList() {
    return detailImageFromJson(images);
  }

  String _getUrl(String src){
    bool hasHttpHead = src.contains("https:");
    if (!hasHttpHead) {
      src = "https:$src";
      return src;
    }
    return src;
  }
}
