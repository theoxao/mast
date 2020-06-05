import 'package:flutter/material.dart';
import 'package:flutter_mast/data/cell.dart';
import 'package:flutter_mast/ui/devices/switch.dart';

class CellDetailPage extends StatefulWidget {
  final Cell cell;

  @override
  _CellDetailPageState createState() => _CellDetailPageState(cell);

  CellDetailPage(this.cell);
}

class _CellDetailPageState extends State<CellDetailPage> {
  final Cell cell;

  @override
  Widget build(BuildContext context) {
    Widget _cellContainer = Container();
    switch (cell.type) {
      case "common_switch":
        {
          _cellContainer = CommonSwitch(cell);
        }
        break;
      case "double_adapter":
        {}
        break;
      case "triple_adapter":
        {}
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(cell.name),
      ),
      body: Container(
        child: _cellContainer,
      ),
    );
  }

  _CellDetailPageState(this.cell);
}
