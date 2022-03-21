import 'package:eye_examination/addcase_screen.dart';
import 'package:eye_examination/home_screen.dart';
import 'package:flutter/material.dart';
import 'about.dart';

class BottomBarSelect extends StatefulWidget {
  @override
  State<BottomBarSelect> createState() => _BottomBarSelectState();
}

class _BottomBarSelectState extends State<BottomBarSelect> {
  int _selectedIndex = 0;
  final List<Widget> _widgetSelect = [HomeScreen(), AddCaseScreen(), About()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetSelect.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 20,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'ADD',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MORE'),
        ],
        selectedItemColor: Colors.blue,
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
      ),
    );
  }
}
