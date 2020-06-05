import 'package:dio/dio.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/cell.dart';

class CellRepo {
  Future<List<Cell>> cellList() async {
    String url = host + "/cells";
    print("request @ " +url);
    Response response = await Dio(getOption).get(url);
    List<Cell> list = [];
    for (var item in response.data) {
      list.add(Cell.fromJson(item));
    }
    return list;
  }
}
