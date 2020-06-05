import 'package:flutter/material.dart';
import 'package:flutter_mast/blocs/cell_bloc.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/cell.dart';
import 'package:flutter_mast/ui/widget/room_tab.dart';
import 'package:flutter_mast/ui/widget/tabs.dart';

class Recent extends StatefulWidget {

  const Recent();

  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> with TickerProviderStateMixin {
  CellBloc bloc = CellBloc();


  @override
  Widget build(BuildContext context) {
    var _tabController = TabController(vsync: this, length: 3);
    return StreamBuilder<List<Cell>>(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<List<Cell>> snapshot) {
        if (snapshot.hasData) {
          List<Cell> list = snapshot.data;
          var tabs = <Widget>[
            DeviceTab(list),
            RoomTab(),
            GroupTab(list)
          ];
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(text: "设备",),
                        Tab(text: "房间",),
                        Tab(text: "分组",),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: tabs,
            ),
          );
        }
        return loading;
      },
    );
  }
}
