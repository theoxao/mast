import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class CellList extends StatefulWidget {
  const CellList();

  @override
  _CellListState createState() => _CellListState();
}

class _CellListState extends State<CellList> {
  var text = "init";
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
//    var t = "";
//    flutterBlue.isScanning.listen((scan) {
//      if(!scan){
//        flutterBlue.scan(timeout: Duration(seconds: 10)).listen((it) {
//          if(it.device.name !=null && it.device.name !=""){
//            print("scan result: " + it.toString());
//          }
//          t += it.device.name + it.device.id.id + it.rssi.toString();
//        });
//      }
//    });


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(text),
    );
  }
}
