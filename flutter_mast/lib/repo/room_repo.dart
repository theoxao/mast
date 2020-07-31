import 'package:dio/dio.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';

class RoomRepo {
  Future<List<Room>> roomList() async {
    String url = host + "/rooms";
    print("request @ " + url);
    Response response = await Dio(getOption).get(url);
    List<Room> list = [];
    for (var item in response.data) {
      list.add(Room.fromJson(item));
    }
    return list;
  }
}
