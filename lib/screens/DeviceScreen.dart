import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ioto_lite/screens/Home.dart';
import 'package:ioto_lite/screens/BLEConnect.dart';
import 'package:ioto_lite/screens/custom_checkbox.dart';

import 'package:flutter_blue/flutter_blue.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const buttonBg = const Color(0xff65C8FF);
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: ExactAssetImage("images/SettingBg.jpg"),
            fit: BoxFit.cover,)
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Row(children: <Widget>[

              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget> [
                    Container(
                      height: 15.0,
                      width: 0.0,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BLEConnect(),
                              fullscreenDialog: true
                          ),);
                      },
                    ),],
                ),
              ),
              Container(
                width: width*0.23,
                height: 0.0,
              ),

              Container(
                alignment: Alignment.topCenter,
                child:
                InkWell(
                  child: Image.asset('images/Logo.png',
                    width: 100.0,height: 92.0,),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>Home(), fullscreenDialog: true));
                  },
                ),
              ),
            ],),
            Container(
              height: height*0.02,
            ),
            Container(
              child: Image.asset('images/motor.png',
                  width: width*0.60,height: height*0.26),),

            Container(
              height: height * 0.57,
              child: CustomCheckbox(device: device,),
            ),
          ],
        ),
      ),
    );
  }
}