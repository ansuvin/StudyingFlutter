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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("취준타임"),
      drawer: buildDrawer(context),
    );
  }
}
