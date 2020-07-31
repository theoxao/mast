import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/ui/pages/device_detail_page.dart';

class DeviceWidget extends StatefulWidget {
  final Device device;

  DeviceWidget(this.device);

  @override
  _DeviceWidgetState createState() => _DeviceWidgetState(device);
}

class _DeviceWidgetState extends State<DeviceWidget> {
  final Device device;

  _DeviceWidgetState(this.device);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DeviceDetailPage(device);
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
                    imageUrl: device.icon,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    device.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: largerText,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    device.desc,
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
