import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screans/design/company_notice.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button.dart';
import 'package:flutter_app/widgets/tag.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyNoticeDetailPage extends StatefulWidget {
  final CompNotice list;
  Position position;

  CompanyNoticeDetailPage({this.list});

  @override
  _CompanyNoticeDetailPageState createState() =>
      _CompanyNoticeDetailPageState();
}

class _CompanyNoticeDetailPageState extends State<CompanyNoticeDetailPage> {
  LatLng latLng;

  _onBookMarkPressed() {
    setState(() {
      widget.list.isBookMark = !widget.list.isBookMark;
      print(widget.list.isBookMark);
    });
  }

  Future<LatLng> getCordinate() async {
    List<Location> location = await locationFromAddress(widget.list.address);
    latLng = LatLng(location[0].latitude, location[0].longitude);
    return latLng;
  }

  @override
  void initState() {
    super.initState();
  }

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
                                widget.list.title,
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
                          "채용분야: ${widget.list.field}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "공고일: ${widget.list.startDate}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "마감일: ${widget.list.endDate}",
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
                        Text(
                          "주소",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.list.address,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                            width: 330,
                            height: 200,
                            child: FutureBuilder(
                                future: getCordinate(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData == false) {
                                    return CircularProgressIndicator();
                                  } else {
                                    return GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                            latLng.latitude, latLng.longitude),
                                        zoom: 17,
                                      ),
                                      markers: _createMarker(),
                                    );
                                  }
                                }))
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
                        Text(
                          "회사 설명",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          widget.list.compInfo,
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
                        Text(
                          "우대 조건",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          widget.list.preferentialInfo,
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
              widget.list.etc != ""
                  ? Card(
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
                              Text(
                                "기타",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                widget.list.etc,
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
                    )
                  : SizedBox(
                      height: 25,
                    ),
              makeTagWidget(tag: widget.list.tag, size: Size(360, 25), mode: 1),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 25),
                  child: makeGradientBtn(
                      msg: "해당 기업에 지원 신청",
                      onPressed: () => print("신청"),
                      mode: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return [
      Marker(
          markerId: MarkerId(widget.list.title),
          position: latLng,
          infoWindow: InfoWindow(
              title: widget.list.title, snippet: widget.list.address))
    ].toSet();
  }
}
