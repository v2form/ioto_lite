import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert' show utf8;

import 'package:flutter_blue/flutter_blue.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;
  @override
  State<StatefulWidget> createState() => _CustomCheckboxState();

}

class _CustomCheckboxState extends State<CustomCheckbox> {
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothCharacteristic targetCharacteristic;

  String connectionText = "";


  bool _rotation = false;
  bool _one = false;
  bool _two = false;
  bool _three = false;
  bool _four = false;
  bool _five = false;
  bool _six = false;
  bool _play = false;

  String seconds="";
  String rotation ="";
  String result = "";

  TextEditingController _controller = new TextEditingController();
  FocusNode _nodeText1 = FocusNode();

  // BluetoothDevice device = super.device;

  _sendString(BluetoothDevice device, String str) async {
    await device.connect();
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      if(service.uuid.toString() == SERVICE_UUID){
        service.characteristics.forEach((characteristic) {
          if(characteristic.uuid.toString() == CHARACTERISTIC_UUID){
            targetCharacteristic = characteristic;
            targetCharacteristic.write(utf8.encode(str));}
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final node = FocusScope.of(context);
    return Container(// color: Colors.blue,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/motorBg.jpg"),
          fit: BoxFit.cover,
        ),
      ),

        child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Column(
            children: <Widget>[
              Container(
                height: height * 0.04,),
              Container(
                // color: Colors.orange,
                height: height * 0.38,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bgButton.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      // color: Colors.blue,
                      width: width * 0.23,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: height * 0.08,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: width * 0.15,
                            height: height * 0.09,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _one = false;
                                  _two = false;
                                  _three = false;
                                  _four = false;
                                  _five = !_five;
                                  _six = false;
                                  if(_five == true){
                                   seconds = "5";
                                  }
                                });
                                },
                              child: Image.asset(_five ? "images/fiveStop.png" : "images/fiveSecs.png"),
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                          ),
                          Container(
                            width: width * 0.15,
                            height: height * 0.09,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _one = false;
                                  _two = false;
                                  _three = false;
                                  _four = !_four;
                                  _five = false;
                                  _six = false;
                                  if(_four == true){
                                    seconds = "4";
                                  }
                                });
                                },
                              child: Image.asset(_four ? "images/fourStop.png" : "images/fourSecs.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.02,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: height * 0.03,
                          ),
                          Container(
                            width: width * 0.15,
                            height: height * 0.09,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _one = false;
                                  _two = false;
                                  _three = false;
                                  _four = false;
                                  _five = false;
                                  _six = !_six;
                                  if(_six == true){
                                    seconds = "6";
                                  }
                                });
                              },
                              child: Image.asset(_six ? "images/sixStop.png" : "images/sixSecs.png"),
                            ),
                          ),
                          Container(
                            height: height * 0.01,
                          ),
                          Container(
                            // color: Colors.green,
                            height: height * 0.13,
                            width: width * 0.2,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rotation = !_rotation;
                                  if(_rotation == true){
                                    rotation = "R";
                                  }else if(_rotation == false){
                                    rotation = "L";
                                  }
                                });
                                },
                              child: Image.asset(_rotation ? "images/right.png" : "images/left.png"),
                            ),
                          ),
                          Container(
                            height: height * 0.015,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: width * 0.15,
                            height: height * 0.09,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _one = false;
                                  _two = false;
                                  _three = !_three;
                                  _four = false;
                                  _five = false;
                                  _six = false;
                                  if(_three == true){
                                    seconds = "3";
                                  }
                                });
                                },
                              child: Image.asset(_three ? "images/threeStop.png" : "images/threeSecs.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.02,
                    ),
                    Container(
                      // color: Colors.blue,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: height * 0.08,
                           ),
                           Container(
                             // color: Colors.blue,
                             width: width * 0.15,
                             height: height * 0.09,
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   _one = !_one;
                                   _two = false;
                                   _three = false;
                                   _four = false;
                                   _five = false;
                                   _six = false;
                                   if(_one == true){
                                     seconds = "1";
                                   }
                                 });
                                 },
                               child: Image.asset(_one ? "images/oneStop.png" : "images/oneSecs.png"),
                             ),
                           ),
                           Container(
                             height: height * 0.03,
                           ),
                           Container(
                             width: width * 0.15,
                             height: height * 0.09,
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   _one = false;
                                   _two = !_two;
                                   _three = false;
                                   _four = false;
                                   _five = false;
                                   _six = false;
                                   if(_two == true){
                                     seconds = "2";
                                   }
                                 });
                                 },
                               child: Image.asset(_two ? "images/twoStop.png" : "images/twoSecs.png"),
                             ),
                           ),
                         ],
                       ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.125,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: width * 0.7,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _play = true;
                            result = rotation+seconds;
                            if(_play == true){
                              _sendString(widget.device, result);}
                            // }else if(_play == false){
                            //   _sendString(widget.device, "Stop");
                            // }
                          });
                          },
                        child: Image.asset("images/playMotor.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}