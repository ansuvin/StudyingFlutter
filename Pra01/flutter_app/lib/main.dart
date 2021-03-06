import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appbar",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar icon menu"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/rainbow.jpg"),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/red.jpg"),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage("assets/red.jpg"),
                //   backgroundColor: Colors.white,
                // ),
                // CircleAvatar(
                //   backgroundImage: AssetImage("assets/red.jpg"),
                //   backgroundColor: Colors.white,
                // ),
              ],
              accountName: Text("BBANTO"),
              accountEmail: Text("bbanto@bbanto.com"),
              onDetailsPressed: (){
                print("arrow is clicked");
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[850],),
              title: Text("Home"),
              onTap: (){
                print("Home is clicked");
              },
              trailing: Icon(Icons.add,
              color: Colors.grey[850],),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[850],),
              title: Text("setting"),
              onTap: (){
                print("setting is clicked");
              },
              trailing: Icon(Icons.add,
                color: Colors.grey[850],),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[850],),
              title: Text("Q&A"),
              onTap: (){
                print("Q&A is clicked");
              },
              trailing: Icon(Icons.add,
                color: Colors.grey[850],),
            ),
          ],
        ),
      ),
    );
  }
}

