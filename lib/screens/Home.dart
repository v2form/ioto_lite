import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:ioto_lite/screens/BLEConnect.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/Bg.jpg"),
            fit: BoxFit.cover,)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Container(
              margin: EdgeInsets.only(right: width * 0.1),
              child: Text('블루투스 연결',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: width * 0.1),
              child: Text('블루투스 연결을 통해 \n'
                  '제품을 직접 작동할수 있습니다. ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: width * 0.08),
              child: SizedBox.fromSize(
                size: Size(225,48),
                child: Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>BLEConnect(), fullscreenDialog: true));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.play_arrow,
                          color: Colors.white,
                          size: 33,),
                        Container(
                          width: 70,
                        ),
                        Text('연결하기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
            ),
          ],
        ),
      ),
    );
  }

}