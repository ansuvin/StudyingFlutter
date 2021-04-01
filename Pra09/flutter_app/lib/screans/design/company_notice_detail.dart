import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screans/design/company_notice.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button.dart';
import 'package:flutter_app/widgets/tag.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CompanyNoticeDetailPage extends StatefulWidget {
  CompNotice list =
      CompNotice("title", "content", "date", true, ["a0", "nc", "df"]);
  Position position;

  CompanyNoticeDetailPage(this.position);

  @override
  _CompanyNoticeDetailPageState createState() =>
      _CompanyNoticeDetailPageState();
}

class _CompanyNoticeDetailPageState extends State<CompanyNoticeDetailPage> {
  _onBookMarkPressed() {
    setState(() {
      widget.list.isBookMark = !widget.list.isBookMark;
    });
  }

  String content = "호잉";

  @override
  Widget build(BuildContext context) {
    widget.list.isBookMark = true;
    return Scaffold(
      appBar: buildAppBar("취준타임"),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "업체명",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
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
                        Text(
                          "채용분야: 모바일 앱, 웹",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "공고일: 2021.03.19",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "마감일: 2021.04.32",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("주소",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("서울 어딘가 어디로 어디빌딩 3층",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 13,),
                        SizedBox(
                          width: 330,
                          height: 200,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(widget.position.latitude, widget.position.longitude),
                              zoom: 15,
                            ),
                            markers: _markers.values.toSet(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("회사 설명",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: 10,),
                        AutoSizeText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the r",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          minFontSize: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("우대 조건",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(height: 10,),
                        AutoSizeText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the r",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          minFontSize: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              content != "" ?
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.all(25),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("기타",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(height: 10,),
                        AutoSizeText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the r",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          minFontSize: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ) : SizedBox(),
              makeTagWidget(tag: List.generate(10, (i) => "${i}.tag"), size: Size(360, 20), mode: 1),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 25),
                  child: makeGradientBtn(msg: "해당 기업에 지원 신청", onPressed: () => print("신청"), mode: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      final marker = Marker(
        markerId: MarkerId("업체명"),
        position: LatLng(widget.position.latitude, widget.position.longitude),
        infoWindow: InfoWindow(
          title: "업체명",
          snippet: "서울 어딘가 어디로 어디빌딩 3층",
        ),
      );
      _markers["업체명"] = marker;
    });
  }
}

final Map<String, Marker> _markers = {};