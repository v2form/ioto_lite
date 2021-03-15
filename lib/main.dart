import 'package:flutter/material.dart';
import 'package:ioto_lite/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSansKR'),
    ); // define it once at root level.
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),fullscreenDialog: true,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/Line.jpg"),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              child: Image.asset('images/Logo.png'),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}