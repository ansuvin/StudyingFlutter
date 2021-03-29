import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/company_vo.dart';
import 'package:flutter_app/screans/design/contracting_company.dart';
import 'package:flutter_app/screans/search_page.dart';
import 'package:flutter_app/widgets/drop_down_button.dart';
import 'widgets/custom_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/drawer.dart';
import 'widgets/text_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/contracting_company": (context) => ContractingCompPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SliderCard> sliderList = [
    SliderCard(title: "취업공고", image: "images/loco.jpg", route: "/"),
    SliderCard(title: "협약업체", image: "images/loco.jpg", route: "/"),
    SliderCard(title: "호잇", image: "images/loco.jpg", route: "/"),
  ];

  List<Notification> notiList = [];

  initNotiList() {
    for(int i=0;i<10;i++) {
      notiList.add(Notification("${i}.title", "내용입니다", "2021.03.19", List.generate(6, (index) => "${index}태그")));
    }
  }

  @override
  void initState() {
    super.initState();
    initNotiList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("취준타임"),
      drawer: buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 18, 26, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "취준타임",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff4F9ECB)),
                      ),
                      Text(
                        "과 함께",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "취업 준비 해요",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            makeSlider(sliderList),
            Container(
              height: 12,
              color: Color(0xffEFEFEF),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
              child: Text(
                "공지사항",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notiList.length,
                itemBuilder: (context, index) {
                  return buildItemCompany(context, index);
                }, 
                scrollDirection: Axis.vertical,
                shrinkWrap: true,),
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
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${notiList[index].title}",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                width: 331,
                height: 54,
                child: Text(
                  "${notiList[index].content}. 이것은 공지사나? 이야야야야야야야야그럼 안되는디dksl",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,),
                overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 22,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return buildItemTag(index);
                          })),
                ),
                Text(
                  "등록일: ${notiList[index].date}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
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
        "#${notiList[index].tag[index]}",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}

Widget makeSlider(List<SliderCard> list) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 30),
    child: CarouselSlider(
        items: list.map((card) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: 357,
              height: 250,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 2)
                  ]),
              child: Center(
                  child: Text(
                card.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )),
            );
          });
        }).toList(),
        options: CarouselOptions(
          autoPlayAnimationDuration: Duration(seconds: 2),
          autoPlayInterval: Duration(seconds: 3),
          autoPlay: true,
          height: 150,
        )),
  );
}

class SliderCard {
  String title;
  String image;
  String route;

  SliderCard(
      {@required this.title, @required this.image, @required this.route});
}

class Notification{
  String title;
  String content;
  String date;
  List<String> tag;

  Notification(this.title, this.content, this.date, this.tag);
}