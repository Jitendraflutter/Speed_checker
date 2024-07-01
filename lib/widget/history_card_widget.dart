import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key? key,
     this.time,
    this.network,
    this.ping,
    this.download,
     this.upload,
    this.ip,
    this.location,
  }) : super(key: key);

  final String? time;
  final IconData? network;
  final int ?ping;
  final double ?download;
  final double ?upload;
  final String ?ip;
  final String? location;

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Text(
              time??"",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    network,
                    size: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.arrowAltCircleDown,

                      ),
                      Text(
                        ' $download',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.arrowAltCircleUp,
                      ),
                      Text(
                        ' $upload',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.sync,

                      ),
                      Text(
                        '$ping',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.router,
                      size: 15,

                    ),
                    Text(
                      ' $ip',
                      style: TextStyle(

                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 15,

                    ),
                    Text(
                      '$location',
                      style: TextStyle(

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}