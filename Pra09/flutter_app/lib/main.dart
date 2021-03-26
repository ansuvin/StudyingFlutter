import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screans/design/custom_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/drawer.dart';
import 'widgets/text_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer(),
        appBar: buildAppBar("custom Appbar"),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("show Dialog"),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => CustomDialog(
                            msg: "${_textController1.text}",
                            description: "${_textController2.text}",
                            buttonText: "이것은 버튼",
                          ));
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return buildItemCompany(context, index.toString());
                    }),
              )
            ],
          ),
        ));
  }
}

Widget buildItemCompany(BuildContext context, String title){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
    ),
    elevation: 5,
    margin: EdgeInsets.fromLTRB(25, 13, 25, 13),
    child: InkWell(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialog(
              msg: "${title}. 업체명",
              description: "${title}. 소개",
              buttonText: "이것은 버튼",
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
                    "업체명",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                "이것은 회사 설명입니다.",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return buildItemTag(index.toString());
                          })),
                ),
                Text(
                  "평균: 2,500~3,000",
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
    ),
  );
}

Widget buildItemTag(String tag) {
  return Container(
    padding: EdgeInsets.fromLTRB(
        5, 1, 5, 1),
    margin: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(
            9),
        border: Border.all(
          color: Colors.blue[400],
        )),
    child: Text("#${tag}"),
  );
}
