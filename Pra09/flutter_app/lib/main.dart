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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("취준타임"),
      drawer: buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: Column(
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
                  SizedBox(height: 3,),
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
          ],
        ),
      ),
    );
  }
}

Widget makeSlider(List<SliderCard> list) {
  return CarouselSlider(
      items: list.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            width: 357,
            height: 210,
            margin: EdgeInsets.only(
                left: 10, right:10, top: 10, bottom: 10),
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
                      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                )),
          );
        });
      }).toList(),
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(seconds: 2),
        autoPlayInterval: Duration(seconds: 3),
        autoPlay: true,
        height: 150,
      ));
}

class SliderCard {
  String title;
  String image;
  String route;

  SliderCard(
      {@required this.title, @required this.image, @required this.route});
}
