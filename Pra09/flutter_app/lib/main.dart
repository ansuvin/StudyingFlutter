import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screans/design/company_notice.dart';
import 'package:flutter_app/screans/design/contracting_company.dart';
import 'package:flutter_app/screans/file_downloader.dart';
import 'package:flutter_app/screans/file_downloader2.dart';
import 'package:flutter_app/screans/fingerprint.dart';
import 'package:flutter_app/screans/login.dart';
import 'package:flutter_app/screans/retrofit.dart';
import 'package:flutter_app/screans/shared_preferences.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/custom_dialog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

const debug = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: debug);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      initialRoute: "/fingerprint",
      routes: {
        "/": (context) => MyHomePage(),
        "/contracting_company": (context) => ContractingCompPage(),
        "/company_notice": (context) => CompanyNoticePage(),
        "/retrofit": (context) => RetrofitScreen(),
        "/shared": (context) => ExSharedPreferences(),
        "/file_downloader": (context) => FileDownLoaderPage(),
        "/file_downloader_2": (context) => FileDownLoaderPage2(),
        "/login": (context) => LoginPage(),
        "/fingerprint": (context) => FingerPrintPage(),
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
    for (int i = 0; i < 10; i++) {
      notiList.add(Notification(
          title: "${i}.title",
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          date: "2021.03.19",
          tag: List.generate(8, (index) => "${index}android")));
    }
  }

  _onHeartPressed(int index) {
    setState(() {
      notiList[index].isFavorite = !notiList[index].isFavorite;
    });
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
        child: ListView(
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
              padding: EdgeInsets.fromLTRB(25, 25, 25, 16),
              child: Text(
                "공지사항",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
            ListView.builder(
              itemCount: notiList.length,
              itemBuilder: (context, index) {
                return buildItemCompany(context, index);
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                    msg: "${notiList[index].title}",
                    content: "${notiList[index].content}",
                    size: Size(346, 502),
                    tag: notiList[index].tag,
                    isFavorite: notiList[index].isFavorite,
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
                      "${notiList[index].title}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                    icon: notiList[index].isFavorite
                        ? Icon(
                            Icons.favorite,
                            size: 28,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            size: 28,
                          ),
                    onPressed: () => _onHeartPressed(index),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Container(
                  height: 60,
                  child: AutoSizeText(
                    "${notiList[index].content}, ",
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
                      children: List.generate(2, (index) {
                        return buildItemTag(index);
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
                          "외 ${notiList[index].tag.length - 2}개",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "등록일: ${notiList[index].date}",
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

  Widget buildItemTag(int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue[400],
          )),
      child: Center(
        child: Text(
          "#${notiList[index].tag[index]}",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
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
              child: Stack(
                children: [
                  Image.asset(
                    "images/loco.jpg",
                    fit: BoxFit.cover,
                    width: 357,
                    height: 250,
                    color: Colors.black,
                    colorBlendMode: BlendMode.softLight,

                  ),
                  Center(
                      child: Text(
                    card.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                ],
              ),
            );
          });
        }).toList(),
        options: CarouselOptions(
          autoPlayAnimationDuration: Duration(seconds: 2),
          autoPlayInterval: Duration(seconds: 4),
          autoPlayCurve: Curves.ease,
          //autoPlay: true,
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

class Notification {
  String title;
  String content;
  String date;
  bool isFavorite;
  List<String> tag;

  Notification(
      {@required this.title,
      @required this.content,
      @required this.date,
      @required this.tag,
      this.isFavorite = false});
}
