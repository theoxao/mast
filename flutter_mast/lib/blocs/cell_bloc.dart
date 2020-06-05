import 'package:flutter_mast/blocs/base_bloc.dart';
import 'package:flutter_mast/data/cell.dart';
import 'package:flutter_mast/repo/cell_repo.dart';

class CellBloc extends BaseBloc<List<Cell>> {
  var list;

  CellBloc() {
    initDate();
  }

  void initDate() async {
    var list = await CellRepo().cellList();
    this.list = list;
    sink.add(this.list);
  }
}
