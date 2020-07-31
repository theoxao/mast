import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';

import 'cell_widget.dart';

class DeviceTab extends StatefulWidget {
  final List<Device> list;

  DeviceTab(this.list);

  @override
  _DeviceTabState createState() => _DeviceTabState(list);
}

class _DeviceTabState extends State<DeviceTab> {
  final List<Device> _list;

  _DeviceTabState(this._list);

  @override
  Widget build(BuildContext context) {
    if (_list == null)
      return Container(
        child: Center(
          child: Text(
            "没有设备",
            style: largerText,
          ),
        ),
        color: Colors.white,
      );
    return Container(
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.7),
        childrenDelegate: SliverChildListDelegate(_list
            .map((e) => GridTile(
          child: DeviceWidget(e),
                ))
            .toList()),
        controller: ScrollController(keepScrollOffset: false),
      ),
      color: Colors.white,
    );
  }
}

class GroupTab extends StatefulWidget {
  final List<Device> list;

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
