import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/cell.dart';
import 'package:flutter_mast/ui/pages/cell_detail_page.dart';

class CellWidget extends StatefulWidget {
  final Cell cell;

  CellWidget(this.cell);

  @override
  _CellWidgetState createState() => _CellWidgetState(cell);
}

class _CellWidgetState extends State<CellWidget> {
  final Cell cell;

  _CellWidgetState(this.cell);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CellDetailPage(cell);
            }));
          },
          child: SizedBox(
            width: 80,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 1,
                  shape: Border(),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: cell.icon,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    cell.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: largerText,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    cell.desc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: secondText,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
