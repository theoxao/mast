import 'package:dio/dio.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';

class DeviceRepo {
  Future<List<Device>> cellList() async {
    String url = host + "/cells";
    print("request @ " + url);
    Response response = await Dio(getOption).get(url);
    List<Device> list = [];
    for (var item in response.data) {
      list.add(Device.fromJson(item));
    }
    return list;
  }
}
