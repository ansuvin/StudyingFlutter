import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/text_field.dart';

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sear",
    );
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  _SearchPageState() {
    print(_searchQuery.text);
    print("_SearchPageState()");
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          print(
              "searchtext = $_searchText, searchQuery.text = ${_searchQuery.text}");
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildAppBar("이건 AppBar"),
      body: buildDropDownTextField()
    );
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      print("_buildSearchList true");
      return _list.map((contact) => ChildItem(contact)).toList();
    } else {
      print("buildSearchList false");
      List<String> _searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  Widget buildDropDownTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildTextField("Tag", _searchQuery),
        ),
        Expanded(
          child: _IsSearching
              ? Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                      color: Colors.grey[500])
                ]),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: _buildSearchList(),
            ),
          )
              : SizedBox(),
        )
      ],
    );
  }
}



class ChildItem extends StatelessWidget {
  final String name;

  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: new Text(this.name));
  }
}
