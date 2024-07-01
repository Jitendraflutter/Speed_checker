import 'package:datetime/controller/home_controller.dart';
import 'package:datetime/screen/setting.dart';
import 'package:datetime/screen/speed_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/app_header.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndexedStack = 1;
  HomeController controller=Get.put(HomeController());
  void _selectedIndex(int index) {
    setState(() {
      _selectedIndexedStack = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize:const Size.fromHeight(50),
          child: AppHeader()),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: IndexedStack(
          index: _selectedIndexedStack,
          children: <Widget>[
            HistoryScreen(),
            SpeedTest(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,

        currentIndex: _selectedIndexedStack,
        onTap: _selectedIndex,

        selectedIconTheme:const IconThemeData(size: 25),
        unselectedIconTheme:const IconThemeData(size: 22),
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.network_check),
            label: 'Speedtest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}