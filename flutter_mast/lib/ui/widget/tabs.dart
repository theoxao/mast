import 'package:flutter/material.dart';
import 'package:flutter_mast/data/cell.dart';

import 'cell_widget.dart';

class DeviceTab extends StatefulWidget {
  final List<Cell> list;

  DeviceTab(this.list);

  @override
  _DeviceTabState createState() => _DeviceTabState(list);
}

class _DeviceTabState extends State<DeviceTab> {
  final List<Cell> _list;

  _DeviceTabState(this._list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.7),
        childrenDelegate: SliverChildListDelegate(_list
            .map((e) => GridTile(
                  child: CellWidget(e),
                ))
            .toList()),
        controller: ScrollController(keepScrollOffset: false),
      ),
    );
  }
}

class GroupTab extends StatefulWidget {
  final List<Cell> list;

  GroupTab(this.list);

  @override
  _GroupTabState createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
