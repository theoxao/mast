import 'package:flutter_mast/blocs/base_bloc.dart';
import 'package:flutter_mast/repo/device_repo.dart';
import 'package:flutter_mast/data/device.dart';

class CellBloc extends BaseBloc<List<Device>> {
  var list;

  CellBloc() {
    initDate();
  }

  void initDate() async {
    var list = await DeviceRepo().cellList();
    this.list = list;
    sink.add(this.list);
  }
}
