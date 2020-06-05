import 'package:flutter_mast/blocs/base_bloc.dart';
import 'package:flutter_mast/data/cell.dart';
import 'package:flutter_mast/repo/room_repo.dart';

class RoomBloc extends BaseBloc<List<Room>> {
  var list;

  RoomBloc() {
    initDate();
  }

  void initDate() async {
    var list = await RoomRepo().roomList();
    this.list = list;
    sink.add(this.list);
  }
}
