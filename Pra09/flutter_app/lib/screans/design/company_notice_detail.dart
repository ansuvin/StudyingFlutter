import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screans/design/company_notice.dart';
import 'package:flutter_app/widgets/app_bar.dart';

class CompanyNoticeDetailPage extends StatefulWidget {
  CompNotice list = CompNotice("title", "content", "date", true, ["a0","nc","df"]);

  @override
  _CompanyNoticeDetailPageState createState() => _CompanyNoticeDetailPageState();
}

class _CompanyNoticeDetailPageState extends State<CompanyNoticeDetailPage> {
  _onBookMarkPressed() {
    setState(() {
      widget.list.isBookMark = !widget.list.isBookMark;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.list.isBookMark = true;
    return Scaffold(
      appBar: buildAppBar("취준타임"),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Card(
            elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              margin: EdgeInsets.only(left: 25, right: 25, top: 25, ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20, right: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text("업체명", style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                            ),),
                          ),
                          IconButton(
                            icon: widget.list.isBookMark
                                ? Icon(
                              Icons.bookmark,
                              size: 28,
                              color: Color(0xff4687FF),
                            )
                                : Icon(
                              Icons.bookmark_border,
                              size: 28,
                            ),
                            onPressed: () => _onBookMarkPressed(),
                          ),
                        ],
                      ),
                      Text("채용분야: 모바일 앱, 웹",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),),
                      Text("공고일: 2021.03.19",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      Text("마감일: 2021.04.32",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                    ],
                  ),
                ),
              ),
        ),
          ],
        ),
      ),
    );
  }
}
