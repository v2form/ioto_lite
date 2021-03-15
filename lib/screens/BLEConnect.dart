
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ioto_lite/screens/Widgets.dart';
import 'package:ioto_lite/screens/Home.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:ioto_lite/screens/DeviceScreen.dart';

class BLEConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('블루투스 연결',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(),fullscreenDialog: true),
            );
          },),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Center(
              child: Text('블루투스가 활성화 되어 있는 상태에서 실행해 주세요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            height: height*0.08,
          ),
          Container(
            height: height*0.65,
            child: Center(
                child: Image.asset('images/noBLE.png')),
          ),
        ],
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('블루투스 연결',
          style: TextStyle(color: Colors.blue,
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(),
                  fullscreenDialog: true
              ),
            );
          },),
      ),

      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 2)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text('블루투스 설정이 활성화 되어있는 상태에서 실행해 주세요',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),),),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                      result: r,
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        r.device.connect();
                        return DeviceScreen(device: r.device);
                      })),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return InkWell(
              borderRadius: BorderRadius.circular(100),
              child:Image.asset('images/EndButton.png',
                width: 94,height: 94,),
              onTap: () => FlutterBlue.instance.stopScan(),
              //backgroundColor: Colors.red,
            );
          } else {
            return InkWell(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('images/StartButton.png',
                  width: 94,height: 94,),
                onTap: () => FlutterBlue.instance
                    .startScan(timeout: Duration(seconds: 30)));
          }
        },
      ),
    );
  }
}