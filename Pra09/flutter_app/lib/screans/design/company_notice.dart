import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screans/design/company_notice_detail.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/tag.dart';

class CompanyNoticePage extends StatefulWidget {
  @override
  _CompanyNoticePageState createState() => _CompanyNoticePageState();

  final List<CompNotice> notiList = [];
}

class _CompanyNoticePageState extends State<CompanyNoticePage> {
  @override
  void initState() {
    super.initState();
  }

  initList() {
    for (int i = 0; i < 8; i++) {
      widget.notiList.add(CompNotice(
          "$i.title",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          "2021.03.31",
          false,
          List.generate(8, (index) => "$index.tag")));
    }
  }

  _onBookMarkPressed(int index) {
    setState(() {
      widget.notiList[index].isBookMark = !widget.notiList[index].isBookMark;
    });
  }

  @override
  Widget build(BuildContext context) {
    initList();
    return Scaffold(
      appBar: buildAppBar("appBar"),
      drawer: buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "취준타임",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0x832B8AC0)),
                  ),
                  Text(
                    "취업 공고",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: widget.notiList.length,
                itemBuilder: (context, index) {
                  return buildItemCompany(context, index);
                },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemCompany(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 5,
      margin: EdgeInsets.fromLTRB(25, 13, 25, 13),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CompanyNoticeDetailPage()
          ));
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.notiList[index].title}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                    icon: widget.notiList[index].isBookMark
                        ? Icon(
                            Icons.bookmark,
                            size: 28,
                            color: Color(0xff4687FF),
                          )
                        : Icon(
                            Icons.bookmark_border,
                            size: 28,
                          ),
                    onPressed: () => _onBookMarkPressed(index),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Container(
                  height: 60,
                  child: AutoSizeText(
                    "${widget.notiList[index].content}, ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    minFontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: List.generate(2, (indextag) {
                        return buildItemTag(
                            widget.notiList[index].tag, indextag);
                      }),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue[400],
                          )),
                      child: Center(
                        child: Text(
                          "외 ${widget.notiList[index].tag.length - 2}개",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "마감일: ${widget.notiList[index].date}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompNotice {
  String title;
  String content;
  String date;
  bool isBookMark;
  List<String> tag;

  CompNotice(this.title, this.content, this.date, this.isBookMark, this.tag);
}
