import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateTimeLocalConvert extends StatefulWidget {
  const DateTimeLocalConvert({super.key});

  @override
  State<DateTimeLocalConvert> createState() => _DateTimeLocalConvertState();
}

class _DateTimeLocalConvertState extends State<DateTimeLocalConvert> {
  TextEditingController controller=TextEditingController();
  String date="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date & Time converter"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
               controller:  controller
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
            var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(controller.text).toLocal();
            String formattedDate = DateFormat("dd MMM yyyy hh:mm").format(dateValue);
              date=formattedDate;
              setState(() {

              });
              }, child: Text("Convert")),
          SizedBox(
            height: 10,
          ),
          Text(date)
        ],
      ),
    );
  }
}
