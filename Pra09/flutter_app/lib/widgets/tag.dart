import 'package:flutter/material.dart';

Widget makeTagList(List<String> tag){
  return SizedBox(
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "태그",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500),
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
                  return buildItemTag(tag, index);
                }),
          ),
        ],
      ));
}

Widget buildItemTag(List<String> tag,int index) {
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