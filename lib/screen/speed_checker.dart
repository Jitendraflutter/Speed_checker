import 'dart:ffi';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


import '../controller/home_controller.dart';
import '../data/dummy_data.dart';
import '../meeter.dart';
import '../widget/extra_info_widget.dart';
import '../widget/test_unit_widget.dart';

class SpeedTest extends StatefulWidget {
  @override
  _SpeedTestState createState() => _SpeedTestState();
}

class _SpeedTestState extends State<SpeedTest> {
  HomeController controller=Get.find();
  bool _animate = true;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TestingUnitsWidget(
                crossAxisAlignment: CrossAxisAlignment.start,
                iconData: FontAwesomeIcons.arrowAltCircleUp,

                digit: '${historyItemList[0].upload}',
                title: 'Upload',
                unit: 'Mbps',
                isDownload: false,
              ),
              TestingUnitsWidget(
                crossAxisAlignment: CrossAxisAlignment.center,
                iconData: FontAwesomeIcons.arrowAltCircleDown,
                iconColor: Colors.green.shade700,
                digit: '${historyItemList[0].download}',
                title: 'Download',
                unit: 'Mbps',
                isDownload: true,
              ),
              TestingUnitsWidget(
                crossAxisAlignment: CrossAxisAlignment.end,
                iconData: Icons.sync,

                digit: '${historyItemList[0].ping}',
                title: 'Ping',
                unit: 'ms',
                isDownload: false,
              ),
            ],
          ),
          SizedBox(height: 130,),
          Obx(()=>controller.isStart.isFalse?GestureDetector(
            onTap: (){
              controller.isStart.value=true;
              controller.startTesting();
            },
            child: SizedBox(
                height: 150,
                width: 150,
                child: AvatarGlow(
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: Colors.green,
                  glowShape: BoxShape.circle,
                  animate: _animate,
                  curve: Curves.fastOutSlowIn,
                  child: Material(     // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child:Text("Go",style: TextStyle(fontSize: 50),),
                      radius: 20.0,
                    ),
                  ),
                ),
              ),
          ):Container(
            child: RadialGauge(
              value:controller.downloadRate.value,
              showAnnotation: true,
            ),
          ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ExtraInfoWidget(
                iconData: Icons.wifi,
                title: 'Wifi',
                subtitle: '${historyItemList[0].wifiName}',
              ),
              ExtraInfoWidget(
                iconData: Icons.router,
                title: 'IP Address',
                subtitle: '${historyItemList[0].ip}',
              ),
              ExtraInfoWidget(
                iconData: Icons.location_on,
                title: 'Location',
                subtitle: '${historyItemList[0].location}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}