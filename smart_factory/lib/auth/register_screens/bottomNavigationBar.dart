import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/add_machine.dart';
import 'package:smart_factory/auth/register_screens/doors.dart';
import 'package:smart_factory/auth/register_screens/machines.dart';
import 'package:smart_factory/auth/register_screens/worker.dart';
import 'package:smart_factory/main.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int currentIndex = 0;
  final screens = [Machines(), AddMachine(), Workers(), Doors()];

  @override
  Widget build(BuildContext context) => Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.pink,

        //selectedLabelStyle: const TextStyle(color: Colors.pink),
        //unselectedLabelStyle: const TextStyle(color: Colors.pink),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_sharp),
            label: 'Makineler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Makine Ekleme',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: 'İşçi'),
          BottomNavigationBarItem(
            icon: Icon(Icons.door_back_door_sharp),
            label: 'Kapılar',
          ),
        ],
      ));
}
