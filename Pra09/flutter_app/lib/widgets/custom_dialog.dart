import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String msg, content;
  final Size size;
  final List<String> tag;
  final bool isFavorite;

  CustomDialog({
    @required this.msg,
    @required this.content,
    @required this.size,
    @required this.tag,
    @required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(
          top: Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding),
      margin: EdgeInsets.only(top: Consts.avataRadius),
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 0.0),
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            msg,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              children: [
                AutoSizeText(
                  content,
                  minFontSize: 16,
                  style: TextStyle(fontSize: 16,),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "태그",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 360,
                        color: Colors.grey[500],
                        margin: EdgeInsets.only(bottom: 5, top: 5),
                      ),
                      SizedBox(
                        width: 360,
                        height: 18,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: tag.length,
                            itemBuilder: (context, index) {
                              return buildItemTag(index);
                            }),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemTag(int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue[400],
          )),
      child: Text(
        "#${tag[index]}",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 20.0;
  static const double avataRadius = 66.0;
}
