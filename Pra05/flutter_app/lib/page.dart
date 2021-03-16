import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  'https://picsum.photos/250?image=9',
  'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
  'https://i.picsum.photos/id/901/200/300.jpg?hmac=hkPEpuBNrCAj1u5K7KgiXGa6ToLCG2iG5C99wLLEdKo'
];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(    // 본래 Column이였으나 ListView로 하면 화면이 넘어가도 '공사 중' 표시가 나오지않음.
      children: [
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(   // InkWell 도 같은 기능을 하면서 물결 이벤트를 주게됨.
        onTap: (){
          print("클릭");
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("택시"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("블랙"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("바이크"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("대리"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("택시"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("블랙"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40,),
                    Text("바이크"),
                  ],
                ),
                Opacity(
                  opacity: 0.0,
                  child: Column(
                    children: [
                      Icon(Icons.local_taxi, size: 40,),
                      Text("대리"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      autoPlay: true,
      height: 150,
      items: dummyItems.map((url){
        return Builder(builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(url, fit: BoxFit.cover,),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (index){
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text("[이벤트] 이것은 공지사항입니다."),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),    // 이 리스트이 스크롤 동작 금지
      shrinkWrap: true,     // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정
      children: items,
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "이용서비스",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "내 정보",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
