import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../../common/common.dart';
import 'cells_page.dart';
import 'recent_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _state = "";
  Timer timer;
  bool fin = true;

  var index = 0;
  static const _options = const<Widget>[
    Recent(),
    CellList()
  ];


  static const List<BottomNavigationBarItem> items =
  const<BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.find_in_page), title: Text("最近")),
    BottomNavigationBarItem(
        icon: Icon(Icons.format_align_left), title: Text("全部"))
  ];


  final channel =
  IOWebSocketChannel.connect("ws://www.theoxao.com:8080/api/check_state");

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => checkState());
    channel.stream.listen((msg) {
      currentState = msg;
      this.fin = true;
    });
  }

  checkState() {
    if (this.fin) {
      String ts = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      channel.sink.add(ts);
      this.fin = false;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _options.elementAt(index)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: index,
        fixedColor: primaryColor,
        onTap: (value) {
          this.setState(() {
            this.index = value;
          });
        },
      ),
    );
  }
}
