import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/feedback_failure.dart';
import 'package:smart_factory/auth/register_screens/record_failure.dart';

class Technician extends StatefulWidget {
  const Technician({super.key});

  @override
  State<Technician> createState() => _TechnicianState();
}

class _TechnicianState extends State<Technician> {
  int currentIndex = 0;
  final screens = [const RecordFailure(), const FeedbackFailure()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: 'Arıza Kayıt'),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback), label: 'Arıza Geri Bildirim')
          ]),
    );
  }
}
